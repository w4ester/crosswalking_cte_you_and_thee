// Simple client-side Explore API helper (shared by Journey and Explore pages)
window.ExploreAPI = (function(){
  function apiBase(){ return (localStorage.getItem('apiBase') || '/api').replace(/\/$/, ''); }
  async function fetchJSON(url){
    const res = await fetch(url, { headers: { 'Accept':'application/json' } });
    if(!res.ok) throw new Error('Bad status');
    try { return await res.json(); } catch { return null; }
  }
  function buildUrl(kind, f){
    const base = apiBase();
    if (kind==='occupations') return `${base}/v1/occupations/search?q=${encodeURIComponent(f.q||'')}&riasec=${encodeURIComponent(f.ri||'')}&job_zone=${encodeURIComponent(f.jobZone||'')}&region=${encodeURIComponent(f.region||'')}&radius=${encodeURIComponent(f.radius||'')}`;
    if (kind==='training') return `${base}/v1/training?keyword=${encodeURIComponent(f.q||'')}&zipcode=${encodeURIComponent(f.zip||'')}&radius=${encodeURIComponent(f.radius||'')}`;
    if (kind==='apprenticeships') return `${base}/v1/apprenticeships?keyword=${encodeURIComponent(f.q||'')}&location=${encodeURIComponent(f.zip||'')}`;
    if (kind==='local') return `${base}/v1/local-help/ajc?zip=${encodeURIComponent(f.zip||'')}`;
    return '';
  }
  async function search(kind, filters){ const url = buildUrl(kind, filters); const data = await fetchJSON(url); return (data && Array.isArray(data.items))? data.items : []; }
  async function searchOccupations(f){ return search('occupations', f); }
  async function searchTraining(f){ return search('training', f); }
  async function searchApprenticeships(f){ return search('apprenticeships', f); }
  async function searchLocal(f){ return search('local', f); }
  async function getOccupationDetail(soc){ const base=apiBase(); const url = `${base}/v1/occupations/${encodeURIComponent(soc)}`; return await fetchJSON(url); }
  return { apiBase, fetchJSON, buildUrl, search, searchOccupations, searchTraining, searchApprenticeships, searchLocal, getOccupationDetail };
})();

