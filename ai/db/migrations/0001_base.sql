-- 0001_base.sql — base schema, roles, helpers, tenants, RLS scaffold

-- Extensions
CREATE EXTENSION IF NOT EXISTS pgcrypto; -- gen_random_uuid

-- Schema
CREATE SCHEMA IF NOT EXISTS app;
COMMENT ON SCHEMA app IS 'Application schema (multi-tenant with RLS)';

-- Roles (attach your DB login roles to these as members)
DO $$ BEGIN
  CREATE ROLE app_auth NOINHERIT;  -- regular application traffic
EXCEPTION WHEN duplicate_object THEN NULL; END $$;
DO $$ BEGIN
  CREATE ROLE app_admin NOINHERIT; -- elevated operations
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

GRANT USAGE ON SCHEMA app TO app_auth, app_admin;

-- Session helpers (set by API per request)
CREATE OR REPLACE FUNCTION app.set_session(p_tenant uuid, p_user uuid, p_is_admin boolean DEFAULT false)
RETURNS void LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
  PERFORM set_config('app.tenant_id', COALESCE(p_tenant::text,''), true);
  PERFORM set_config('app.user_id', COALESCE(p_user::text,''), true);
  PERFORM set_config('app.is_admin', CASE WHEN p_is_admin THEN 't' ELSE 'f' END, true);
END$$;
REVOKE ALL ON FUNCTION app.set_session(uuid, uuid, boolean) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION app.set_session(uuid, uuid, boolean) TO app_auth, app_admin;

-- Accessors
CREATE OR REPLACE FUNCTION app.current_tenant() RETURNS uuid LANGUAGE sql STABLE AS $$
  SELECT NULLIF(current_setting('app.tenant_id', true), '')::uuid $$;
CREATE OR REPLACE FUNCTION app.current_user_id() RETURNS uuid LANGUAGE sql STABLE AS $$
  SELECT NULLIF(current_setting('app.user_id', true), '')::uuid $$;
CREATE OR REPLACE FUNCTION app.is_admin() RETURNS boolean LANGUAGE sql STABLE AS $$
  SELECT current_setting('app.is_admin', true) = 't' $$;

-- Tenants
CREATE TABLE IF NOT EXISTS app.tenants (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug        text UNIQUE NOT NULL,
  name        text NOT NULL,
  created_at  timestamptz NOT NULL DEFAULT now(),
  updated_at  timestamptz NOT NULL DEFAULT now()
);

-- Updated at trigger
CREATE OR REPLACE FUNCTION app.tg_touch_updated_at() RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN NEW.updated_at = now(); RETURN NEW; END $$;
DO $$ BEGIN
  CREATE TRIGGER tenants_touch
  BEFORE UPDATE ON app.tenants
  FOR EACH ROW EXECUTE FUNCTION app.tg_touch_updated_at();
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

-- RLS policies
ALTER TABLE app.tenants ENABLE ROW LEVEL SECURITY;
-- Admins can see all rows; non-admins only their tenant
DROP POLICY IF EXISTS tenants_isolation ON app.tenants;
CREATE POLICY tenants_isolation ON app.tenants
  USING (
    app.is_admin() OR id = app.current_tenant()
  );

-- Grants
GRANT SELECT, INSERT, UPDATE, DELETE ON app.tenants TO app_auth, app_admin;

-- Seed example tenant (optional)
INSERT INTO app.tenants (slug, name)
VALUES ('demo', 'Demo Tenant')
ON CONFLICT (slug) DO NOTHING;

