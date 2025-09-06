<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Robust drop prevention (capture-level) -->
    <script>(function(){function block(e){e.preventDefault();e.stopPropagation();}window.addEventListener('dragover',block,{capture:true});window.addEventListener('drop',block,{capture:true});document.addEventListener('dragover',block,{capture:true});document.addEventListener('drop',block,{capture:true});})();</script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CTE Cluster Crosswalk Repository</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Montserrat', 'Calibri', 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #BD0934 0%, #FFC838 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        h1 {
            color: #231F20;
            font-size: 3rem;
            margin-bottom: 15px;
            text-align: center;
            background: linear-gradient(135deg, #BD0934, #FFC838);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .subtitle {
            text-align: center;
            color: #231F20;
            margin-bottom: 50px;
            font-size: 1.2rem;
        }

        .clusters-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .cluster-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .cluster-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            border-color: #BD0934;
        }

        .cluster-title {
            font-size: 1.4rem;
            color: #231F20;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .cluster-description {
            color: #231F20;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .cluster-links {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .cluster-link {
            display: inline-flex;
            align-items: center;
            padding: 12px 20px;
            background: linear-gradient(135deg, #BD0934, #FFC838);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: center;
            justify-content: center;
        }

        .cluster-link:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 12px rgba(189, 9, 52, 0.4);
        }

        .cluster-link svg {
            margin-left: 8px;
            transition: transform 0.3s ease;
        }

        .cluster-link:hover svg {
            transform: translateX(3px);
        }
        .top-nav { display:flex; justify-content:center; align-items:center; gap:10px; position: sticky; top: 0; z-index: 200; margin-bottom:12px; }
        .menu-toggle { display:none; border:1px solid #e2e8f0; background:#fff; border-radius:10px; padding:8px 12px; font-weight:700; cursor:pointer; }

        /* Quick-jump nav */
        .quick-jump {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 999px;
            padding: 8px 12px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.06);
        }
        .quick-jump a {
            display: inline-block;
            padding: 8px 12px;
            background: #231F20;
            color: #fff;
            text-decoration: none;
            border-radius: 999px;
            font-size: 0.95rem;
            transition: opacity 0.2s ease;
        }
        .quick-jump a:hover { opacity: 0.9; }
        .quick-jump a.active { background: linear-gradient(135deg, #BD0934, #FFC838); }

        /* Audience Access */
        .audience-access {
            margin-bottom: 40px;
            display: none; /* hidden to keep crosswalks the focus */
        }
        .audience-access h2 {
            color: #231F20;
            margin-bottom: 15px;
            font-size: 1.5rem;
        }
        .audience-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 25px;
            align-items: stretch;
        }
        .cta-stack {
            display: grid;
            grid-template-rows: 1fr 1fr;
            gap: 25px;
        }
        .cta-card {
            background: white;
            border-radius: 15px;
            padding: 24px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border: 2px solid transparent;
            display: flex;
            flex-direction: column;
        }
        .cta-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            border-color: #BD0934;
        }
        .cta-title {
            font-size: 1.3rem;
            color: #231F20;
            margin-bottom: 10px;
            font-weight: 600;
        }
        .cta-description {
            color: #231F20;
            margin-bottom: 16px;
            line-height: 1.6;
        }
        .cta-primary {
            border-left: 4px solid #BD0934;
        }

        .info-section {
            background: #E2E3E4;
            border-radius: 12px;
            padding: 25px;
            margin-top: 40px;
            border-left: 4px solid #BD0934;
        }

        .info-section h2 {
            color: #231F20;
            margin-bottom: 15px;
            font-size: 1.5rem;
        }

        .info-section p {
            color: #4a5568;
            line-height: 1.8;
            margin-bottom: 10px;
        }

        .info-section ul {
            margin-left: 25px;
            color: #4a5568;
            line-height: 1.8;
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
            color: #231F20;
        }

        /* Feedback floating button */
        .fab-pill { position: fixed; right: calc(20px + env(safe-area-inset-right)); bottom: calc(20px + env(safe-area-inset-bottom)); background: linear-gradient(135deg,#BD0934,#FFC838); color:#fff; border:none; border-radius:999px; padding:12px 16px; font-weight:700; box-shadow:0 8px 24px rgba(0,0,0,0.25); cursor:pointer; z-index: 350; }
        #feedbackText { width:100%; min-height:120px; border:1px solid #e2e8f0; border-radius:8px; padding:10px; font-family: inherit; }

        /* Modal styles */
        .modal {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.5);
            display: none;
            align-items: center;
            justify-content: center;
            padding: 20px;
            z-index: 200;
        }
        .modal.open { display: flex; }
        .modal-content {
            background: #fff;
            border-radius: 12px;
            max-width: 720px;
            width: 100%;
            padding: 24px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            border-left: 4px solid #BD0934;
        }
        .modal-header { display:flex; justify-content: space-between; align-items:center; margin-bottom: 10px; }
        .modal-close { border:none; background:transparent; font-size: 1.5rem; cursor:pointer; color:#231F20; }

        @media (max-width: 900px){
            .top-nav{ justify-content:space-between; }
            .menu-toggle{ display:inline-block; }
            .quick-jump{ display:none; border-radius:12px; gap:8px; padding:10px; flex-direction:column; align-items:flex-start; }
            .quick-jump.open{ display:flex; }
            .quick-jump a{ border-radius:8px; }
        }
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }
            
            .clusters-grid {
                grid-template-columns: 1fr;
            }
            .audience-grid {
                grid-template-columns: 1fr;
            }
            .cta-stack {
                grid-template-rows: auto;
            }
            
            .container {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <nav class="top-nav">
        <button class="menu-toggle" id="menuToggle" aria-label="Menu" aria-controls="site-menu" aria-expanded="false">Menu</button>
        <div class="quick-jump" id="site-menu">
            <a href="index.aspx" class="active">Home</a>
            <a href="dt-crosswalk-table.aspx">Digital Technology</a>
            <a href="003_ed_crosswalk-table.aspx">Education</a>
            <a href="enr-crosswalk-table.aspx">ENR</a>
            <a href="pss_crosswalk_html.aspx">PSS</a>
            <a href="assessments.html">Student Journey</a>
        </div>
    </nav>
    <div class="container">
        <h1>CTE Cluster Crosswalk Repository</h1>
        <p class="subtitle">Maryland State Department of Education - Career and Technical Education Program Crosswalks</p>
        <div class="info-section" id="audience-guides">
            <h2>Audience Guides</h2>
            <div class="clusters-grid">
                <div class="cluster-card">
                    <h2 class="cluster-title">Students &amp; Parents/Guardians</h2>
                    <p class="cluster-description">Quick tips to explore programs, plan courses, and discuss options.</p>
                    <div class="cluster-links">
                        <a href="#" class="cluster-link" data-modal="students">How to Use</a>
                    </div>
                </div>
                <div class="cluster-card">
                    <h2 class="cluster-title">Counselors</h2>
                    <p class="cluster-description">Filtering, exports, and alignment tips for advising conversations.</p>
                    <div class="cluster-links">
                        <a href="#" class="cluster-link" data-modal="counselors">How to Use</a>
                    </div>
                </div>
                <div class="cluster-card">
                    <h2 class="cluster-title">Teachers</h2>
                    <p class="cluster-description">Connect lessons to pathways, certifications, and cross-cluster links.</p>
                    <div class="cluster-links">
                        <a href="#" class="cluster-link" data-modal="teachers">How to Use</a>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="audience-access">
            <h2>Audience Access</h2>
            <div class="audience-grid">
                <div class="cta-card cta-primary">
                    <h3 class="cta-title">Students &amp; Parents</h3>
                    <p class="cta-description">Explore Programs &amp; Pathways — Find CTE programs, see aligned careers, and learn how to use crosswalks to plan courses and next steps.</p>
                    <a href="#students-parents" class="cluster-link">Explore Programs &amp; Pathways
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M5 12h14M12 5l7 7-7 7"/>
                        </svg>
                    </a>
                </div>
                <div class="cta-stack">
                    <div class="cta-card">
                        <h3 class="cta-title">Counselors</h3>
                        <p class="cta-description">Advising With Crosswalks — Use filters and exports to guide student course selection, pathways, and postsecondary alignment.</p>
                        <a href="#counselors" class="cluster-link">Open Advising Guidance
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M5 12h14M12 5l7 7-7 7"/>
                            </svg>
                        </a>
                    </div>
                    <div class="cta-card">
                        <h3 class="cta-title">Teachers</h3>
                        <p class="cta-description">Align Courses &amp; Standards — Connect course content to pathways, certifications, and program standards; plan updates and integrations.</p>
                        <a href="#teachers" class="cluster-link">Open Alignment Guidance
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M5 12h14M12 5l7 7-7 7"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="clusters-grid">
            <div class="cluster-card">
                <h2 class="cluster-title">Digital Technology</h2>
                <p class="cluster-description">Comprehensive crosswalk analysis for Digital Technology programs, including curriculum alignment and career pathways.</p>
                <div class="cluster-links">
                    <a href="dt-crosswalk-table.html" class="cluster-link">
                        View Digital Technology Crosswalk
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M5 12h14M12 5l7 7-7 7"/>
                        </svg>
                    </a>
                </div>
            </div>

            <div class="cluster-card">
                <h2 class="cluster-title">Education</h2>
                <p class="cluster-description">Education cluster crosswalk detailing teaching preparation programs and educational support services pathways.</p>
                <div class="cluster-links">
                    <a href="003_ed_crosswalk-table.html" class="cluster-link">
                        View Education Crosswalk
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M5 12h14M12 5l7 7-7 7"/>
                        </svg>
                    </a>
                </div>
            </div>

            <div class="cluster-card">
                <h2 class="cluster-title">Environmental & Natural Resources</h2>
                <p class="cluster-description">Comprehensive crosswalk for Environmental & Natural Resources programs, including renewable energy specializations.</p>
                <div class="cluster-links">
                    <a href="enr-crosswalk-table.aspx" class="cluster-link">
                        View ENR Crosswalk
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M5 12h14M12 5l7 7-7 7"/>
                        </svg>
                    </a>
                    
                </div>
            </div>

            <div class="cluster-card">
                <h2 class="cluster-title">Public Safety and Services (PSS)</h2>
                <p class="cluster-description">Public Safety and Services cluster crosswalk with detailed alignment to career pathways and industry requirements.</p>
                <div class="cluster-links">
                    <a href="pss_crosswalk.html" class="cluster-link">
                        View PSS Crosswalk
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M5 12h14M12 5l7 7-7 7"/>
                        </svg>
                    </a>
                </div>
            </div>
        </div>

        <div class="info-section" id="contact-training">
            <h2>Contact &amp; Training</h2>
            <p>Have questions or want to request a roadshow session? Reach out to our team.</p>
            <div class="contact-actions" style="display:flex;flex-wrap:wrap;gap:12px;">
                <a class="cluster-link" href="mailto:occpcteprograms.msde@maryland.gov?subject=From%20CTE%20Crosswalking%20-%20Contact&amp;body=hello%20%7Binsert%20name%7D%2C%0A%0APlease%20include%20your%20best%20email%20for%20contact.%0A%0ATopic%2FQuestion%3A%20">Contact Us
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                </a>
                <a class="cluster-link" href="mailto:occpcteprograms.msde@maryland.gov?subject=From%20CTE%20Crosswalking%20-%20Roadshow%20Request&amp;body=hello%20%7Binsert%20name%7D%2C%0A%0APlease%20include%20your%20best%20email%20for%20contact.%0A%0ADistrict%2FSchool%3A%20%0ARole%3A%20%0APreferred%20dates%2Ftimes%3A%20%0AAudience%20(administrators%2Fcounselors%2Fteachers)%3A%20%0AEstimated%20audience%20size%3A%20%0ALocation%2Fvirtual%20preference%3A%20">Request a Roadshow
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                </a>
            </div>
        </div>

        <div class="info-section">
            <h2>About These Crosswalks</h2>
            <p>These crosswalk tables provide comprehensive alignment between Career and Technical Education (CTE) programs and various educational standards, career pathways, and industry requirements.</p>
            
            <h3 style="margin-top: 20px; margin-bottom: 10px; color: #231F20;">Features:</h3>
            <ul>
                <li>Interactive tables with sorting and filtering capabilities</li>
                <li>Export functionality to Excel for offline analysis</li>
                <li>Detailed program-to-pathway alignments</li>
                <li>Career cluster mappings and industry connections</li>
                <li>Postsecondary education alignment opportunities</li>
            </ul>

            <h3 style="margin-top: 20px; margin-bottom: 10px; color: #231F20;">How to Use:</h3>
            <ul>
                <li>Click on any cluster button above to view the detailed crosswalk table</li>
                <li>Use the search and filter features within each table to find specific programs</li>
                <li>Export tables to Excel using the download button for further analysis</li>
                <li>Print individual crosswalks using your browser's print function</li>
            </ul>

            <h3 style="margin-top: 20px; margin-bottom: 10px; color: #231F20;">Blueprint Alignment & Outreach</h3>
            <p>We imagine an accompanying website or landing page that provides clear instructions on how to navigate these crosswalks and explains how this work supports the Blueprint for Maryland's Future.</p>
            <p>We also envision taking this on a roadshow to engage LEA administrators, counselors, and teachers.</p>
        </div>

        <!-- Audience Guidance now provided via modals -->
        
        <div class="modal" id="modal-students" aria-hidden="true" role="dialog" aria-labelledby="studentsTitle">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 id="studentsTitle" style="color:#231F20;">Students &amp; Parents</h2>
                    <button class="modal-close" data-close aria-label="Close">×</button>
                </div>
                <ul style="margin-left:20px;color:#4a5568;line-height:1.8;">
                    <li>Use the cluster buttons to explore programs and related careers.</li>
                    <li>Check requirements and recommended sequences to plan courses.</li>
                    <li>Export a table view to discuss options with your counselor.</li>
                    <li>Where available, use the Source/program links in tables to review requirements and recommended sequences.</li>
                </ul>
            </div>
        </div>
        
        <div class="modal" id="modal-counselors" aria-hidden="true" role="dialog" aria-labelledby="counselorsTitle">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 id="counselorsTitle" style="color:#231F20;">Counselors</h2>
                    <button class="modal-close" data-close aria-label="Close">×</button>
                </div>
                <ul style="margin-left:20px;color:#4a5568;line-height:1.8;">
                    <li>Filter crosswalks by program, credential, or pathway for advising.</li>
                    <li>Export and annotate tables to support academic planning meetings.</li>
                    <li>Reference postsecondary alignments when discussing dual enrollment/AP options.</li>
                </ul>
            </div>
        </div>
        
        <div class="modal" id="modal-teachers" aria-hidden="true" role="dialog" aria-labelledby="teachersTitle">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 id="teachersTitle" style="color:#231F20;">Teachers</h2>
                    <button class="modal-close" data-close aria-label="Close">×</button>
                </div>
                <ul style="margin-left:20px;color:#4a5568;line-height:1.8;">
                    <li>Map lesson plans to pathway standards and industry certifications.</li>
                    <li>Identify integration points with related programs and clusters.</li>
                    <li>Share exports with PLCs for alignment and curriculum updates.</li>
                </ul>
            </div>
        </div>

        <!-- Feedback modal -->
        <div class="modal" id="modal-feedback" aria-hidden="true" role="dialog" aria-labelledby="feedbackTitle">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 id="feedbackTitle" style="color:#231F20;">Send Feedback</h2>
                    <button class="modal-close" data-close aria-label="Close">×</button>
                </div>
        <p style="color:#334155;margin:0 0 8px;">Tell us what’s working and what to improve.</p>
        <div class="fb-grid" style="display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:10px;">
            <div>
                <label style="display:block;color:#334155;font-size:0.95rem;">Name</label>
                <input id="fbName" type="text" style="width:100%;padding:8px 10px;border:1px solid #e2e8f0;border-radius:8px;">
            </div>
            <div>
                <label style="display:block;color:#334155;font-size:0.95rem;">Email</label>
                <input id="fbEmail" type="email" style="width:100%;padding:8px 10px;border:1px solid #e2e8f0;border-radius:8px;">
            </div>
            <div>
                <label style="display:block;color:#334155;font-size:0.95rem;">Role</label>
                <select id="fbRole" style="width:100%;padding:8px 10px;border:1px solid #e2e8f0;border-radius:8px;">
                    <option value="">— Select —</option>
                    <option>Student/Parent/Guardian</option>
                    <option>Counselor</option>
                    <option>Teacher</option>
                    <option>Administrator</option>
                    <option>Other</option>
                </select>
            </div>
            <div>
                <label style="display:block;color:#334155;font-size:0.95rem;">Category</label>
                <select id="fbCategory" style="width:100%;padding:8px 10px;border:1px solid #e2e8f0;border-radius:8px;">
                    <option>General</option>
                    <option>Bug</option>
                    <option>Content Update</option>
                    <option>Feature Request</option>
                    <option>Question</option>
                    <option>Other</option>
                </select>
            </div>
        </div>
        <div style="margin-top:10px;">
            <label style="display:block;color:#334155;font-size:0.95rem;">Message</label>
            <textarea id="fbMessage" placeholder="Your feedback..." style="width:100%;min-height:120px;border:1px solid #e2e8f0;border-radius:8px;padding:10px;"></textarea>
        </div>
        <div style="display:flex;gap:10px;justify-content:flex-end;margin-top:10px;">
            <button id="copyFeedback" class="cluster-link" style="background:#0ea5e9;">Copy</button>
            <button id="emailFeedback" class="cluster-link">Email</button>
        </div>
            </div>
        </div>

        <div class="footer">
            <p>Maryland State Department of Education - Division of Career and College Readiness</p>
            <p style="margin-top: 10px; font-size: 0.9rem;">© 2025 MSDE CTE Crosswalk Repository</p>
        </div>
    </div>
    <button id="feedbackFab" aria-label="Open feedback">Feedback</button>
</body>
</html>
<script>
    (function(){
        const toggle = document.getElementById('menuToggle');
        const menu = document.getElementById('site-menu');
        if (toggle && menu){ toggle.addEventListener('click', ()=>{ const open = menu.classList.toggle('open'); toggle.setAttribute('aria-expanded', open?'true':'false'); }); }
        const openers = document.querySelectorAll('[data-modal]');
        const modals = {
            students: document.getElementById('modal-students'),
            counselors: document.getElementById('modal-counselors'),
            teachers: document.getElementById('modal-teachers'),
            feedback: document.getElementById('modal-feedback')
        };
        function openModal(key){
            const m = modals[key];
            if (!m) return;
            m.classList.add('open');
            m.setAttribute('aria-hidden','false');
        }
        function closeModal(m){
            m.classList.remove('open');
            m.setAttribute('aria-hidden','true');
        }
        openers.forEach(a => a.addEventListener('click', (e) => {
            const key = a.getAttribute('data-modal');
            if (!key) return;
            e.preventDefault();
            openModal(key);
        }));
        document.querySelectorAll('.modal').forEach(m => {
            m.addEventListener('click', (e) => {
                if (e.target === m || e.target.hasAttribute('data-close')) closeModal(m);
            });
        });
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                document.querySelectorAll('.modal.open').forEach(closeModal);
            }
        });
        // Feedback FAB
        const fab = document.getElementById('feedbackFab');
        if (fab) {
            fab.addEventListener('click', () => openModal('feedback'));
        }
        function buildFeedbackText(){
            const name = (document.getElementById('fbName')?.value||'').trim();
            const email = (document.getElementById('fbEmail')?.value||'').trim();
            const role = (document.getElementById('fbRole')?.value||'').trim();
            const cat = (document.getElementById('fbCategory')?.value||'').trim();
            const msg = (document.getElementById('fbMessage')?.value||'').trim();
            const page = `${document.title} (${location.href})`;
            return `Name: ${name}\nEmail: ${email}\nRole: ${role}\nCategory: ${cat}\nPage: ${page}\n\nMessage:\n${msg}`.trim();
        }
        const copyBtn = document.getElementById('copyFeedback');
        if (copyBtn) {
            copyBtn.addEventListener('click', async () => {
                const txt = buildFeedbackText();
                try { await navigator.clipboard.writeText(txt); alert('Copied to clipboard.'); } catch {}
            });
        }
        const emailBtn = document.getElementById('emailFeedback');
        if (emailBtn) {
            emailBtn.addEventListener('click', () => {
                const cat = (document.getElementById('fbCategory')?.value||'General').trim();
                const subj = encodeURIComponent(`CTE Crosswalks Feedback - ${cat}`);
                const body = encodeURIComponent(buildFeedbackText());
                window.location.href = `mailto:occpcteprograms.msde@maryland.gov?subject=${subj}&body=${body}`;
            });
        }
    })();
</script>
