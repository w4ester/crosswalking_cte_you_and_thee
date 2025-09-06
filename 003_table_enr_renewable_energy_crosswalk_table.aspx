<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Robust drop prevention (capture-level) -->
    <script>(function(){function block(e){e.preventDefault();e.stopPropagation();}window.addEventListener('dragover',block,{capture:true});window.addEventListener('drop',block,{capture:true});document.addEventListener('dragover',block,{capture:true});document.addEventListener('drop',block,{capture:true});})();</script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ENR Renewable Energy Crosswalk Table</title>
    <style>
        body {
            font-family: 'Montserrat', 'Calibri', 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #BD0934 0%, #FFC838 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }
        /* Top cluster nav */
        .top-nav { display:flex; justify-content:center; position: sticky; top: 0; z-index: 300; margin-bottom: 10px; }
        .quick-jump { display:flex; flex-wrap:wrap; gap:10px; background:#fff; border:1px solid #e2e8f0; border-radius:999px; padding:6px 10px; box-shadow:0 1px 4px rgba(0,0,0,0.06); }
        .quick-jump a { display:inline-block; padding:6px 10px; background:#231F20; color:#fff; text-decoration:none; border-radius:999px; font-size:0.9rem; transition:opacity .2s ease; }
        .quick-jump a:hover { opacity:.9; }
        .quick-jump a.active { background: linear-gradient(135deg, #BD0934, #FFC838); }
        h1 {
            color: #231F20;
            font-size: 2.2rem;
            margin-bottom: 10px;
            text-align: center;
            background: linear-gradient(135deg, #BD0934, #FFC838);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .table-container {
            overflow-x: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            min-width: 1400px;
        }
        thead { background: linear-gradient(135deg, #BD0934, #FFC838); color: white; }
        th {
            padding: 15px 8px;
            text-align: left;
            font-weight: 600;
            position: sticky;
            top: 0;
            z-index: 10;
            border: none;
        }
        td {
            padding: 10px 8px;
            border: 1px solid #ddd;
            vertical-align: top;
            font-size: 14px;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover { background: #E2E3E4; }
        .sector-2year {
            background-color: #fff8e1;
        }
        .sector-4year {
            background-color: #e8f5e9;
        }
        .credential-yes { color: #2e7d32; font-weight: 600; }
        .source-link {
            color: #1976d2;
            font-size: 12px;
        }
        .note {
            background: #E2E3E4;
            padding: 15px;
            margin-top: 20px;
            border-left: 4px solid #BD0934;
            font-size: 14px;
            border-radius: 6px;
        }
        /* Feedback floating button and modal */
        #feedbackFab { position: fixed; right: calc(20px + env(safe-area-inset-right)); bottom: calc(20px + env(safe-area-inset-bottom)); background: linear-gradient(135deg,#BD0934,#FFC838); color:#fff; border:none; border-radius:999px; padding:12px 16px; font-weight:700; box-shadow:0 8px 24px rgba(0,0,0,0.25); cursor:pointer; z-index: 1200; }
        #feedbackText { width:100%; min-height:120px; border:1px solid #e2e8f0; border-radius:8px; padding:10px; font-family: inherit; }
        .modal { position: fixed; inset: 0; background: rgba(0,0,0,0.5); display: none; align-items: center; justify-content: center; padding: 20px; z-index: 1300; }
        .modal.open { display: flex; }
        .modal-content { background: #fff; border-radius: 12px; max-width: 720px; width: 100%; padding: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.3); border-left: 4px solid #BD0934; }
        .modal-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:8px; }
        .modal-close { border:none; background:transparent; font-size:1.5rem; cursor:pointer; color:#231F20; }
    </style>
</head>
<body>
    <nav class="top-nav">
        <div class="quick-jump">
            <a href="index.aspx">Home</a>
            <a href="dt-crosswalk-table.aspx">Digital Technology</a>
            <a href="003_ed_crosswalk-table.aspx">Education</a>
            <a href="enr-crosswalk-table.aspx" class="active">ENR</a>
            <a href="pss_crosswalk_html.aspx">PSS</a>
        </div>
    </nav>
    <div class="container">
    <h1>ENR Cluster - Renewable Energy Postsecondary Crosswalk</h1>
    <div style="text-align:center; margin-bottom: 10px; color:#2c5f2d; font-size:0.95rem;">
        <a href="index.aspx">Home</a> &gt; ENR &gt; Renewable
    </div>
    
    <div class="controls" style="display:flex;flex-wrap:wrap;gap:12px;align-items:center;justify-content:space-between;margin:12px 0 16px;">
        <div class="search-box" style="position:relative;flex:1;min-width:260px;">
            <input id="searchInput" type="text" placeholder="Search institution, program, credential..." style="width:100%;padding:10px 40px 10px 12px;border:2px solid #e2e8f0;border-radius:10px;font-size:14px;">
            <span style="position:absolute;right:12px;top:50%;transform:translateY(-50%);color:#a0aec0;">🔍</span>
        </div>
        <div class="btns" style="display:flex;gap:8px;flex-wrap:wrap;">
            <button id="showAllBtn" style="background:#48bb78;color:#fff;border:none;border-radius:8px;padding:10px 14px;cursor:pointer;">Show All</button>
            <button id="twoYearBtn" style="background:#4a7c59;color:#fff;border:none;border-radius:8px;padding:10px 14px;cursor:pointer;">2-Year</button>
            <button id="fourYearBtn" style="background:#2c5f2d;color:#fff;border:none;border-radius:8px;padding:10px 14px;cursor:pointer;">4-Year</button>
            <button id="exportBtn" style="background:linear-gradient(135deg,#BD0934,#FFC838);color:#fff;border:none;border-radius:8px;padding:10px 14px;cursor:pointer;">📊 Export CSV</button>
        </div>
    </div>
    <div class="table-container">
        <table id="enrRenewTable">
            <thead>
                <tr>
                    <th>High School Program</th>
                    <th>Institution</th>
                    <th>Sector</th>
                    <th>Degree</th>
                    <th>Program/Major</th>
                    <th>Lower Division Certificates</th>
                    <th>Credential Content in Major?</th>
                    <th>Source</th>
                </tr>
            </thead>
            <tbody>
                <!-- Community Colleges -->
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>Anne Arundel CC (AACC)</td>
                    <td>2-Year</td>
                    <td>AS</td>
                    <td>Environmental Science</td>
                    <td>Renewable Energy Certificate (LDC)</td>
                    <td class="credential-yes">Yes - OSHA 10, ESRI GIS coursework</td>
                    <td class="source-link">aacc.edu</td>
                </tr>
                
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>Montgomery College (MC)</td>
                    <td>2-Year</td>
                    <td>AS</td>
                    <td>Environmental Science & Policy</td>
                    <td>Renewable Energy Technology Certificate (LDC)</td>
                    <td class="credential-yes">Yes - Solar PV theory, OSHA 10 prep</td>
                    <td class="source-link">montgomerycollege.edu</td>
                </tr>
                
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>Howard CC (HCC)</td>
                    <td>2-Year</td>
                    <td>AS (transfer)</td>
                    <td>Environmental Science</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - GIS mapping, conservation techniques</td>
                    <td class="source-link">howardcc.edu</td>
                </tr>
                
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>Prince George's CC (PGCC)</td>
                    <td>2-Year</td>
                    <td>AAS</td>
                    <td>Environmental Science Technology</td>
                    <td>Sustainable Energy Certificate (LDC)</td>
                    <td class="credential-yes">Yes - Renewable energy systems, environmental assessment</td>
                    <td class="source-link">pgcc.edu</td>
                </tr>
                
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>College of Southern Maryland (CSM)</td>
                    <td>2-Year</td>
                    <td>AS</td>
                    <td>Environmental Science</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - CBLP aligned (Chesapeake Bay), GIS applications</td>
                    <td class="source-link">csmd.edu</td>
                </tr>
                
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>Harford CC</td>
                    <td>2-Year</td>
                    <td>AS</td>
                    <td>Environmental Studies</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Field research, sustainability practices</td>
                    <td class="source-link">harford.edu</td>
                </tr>
                
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>Frederick CC</td>
                    <td>2-Year</td>
                    <td>AAS</td>
                    <td>Alternative Energy Technology</td>
                    <td>Solar Energy Installation Certificate (LDC)*</td>
                    <td class="credential-yes">Yes - NEC 690 theory, PV Associate knowledge</td>
                    <td class="source-link">frederick.edu</td>
                </tr>
                
                <tr class="sector-2year">
                    <td>Renewable Energy</td>
                    <td>Cecil College</td>
                    <td>2-Year</td>
                    <td>AS</td>
                    <td>Environmental Science</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Natural resource mgmt, GIS mapping</td>
                    <td class="source-link">cecil.edu</td>
                </tr>
                
                <!-- 4-Year Universities -->
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>UMD-College Park</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Environmental Science & Technology</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - GIS cert pathway, CBLP content, erosion control</td>
                    <td class="source-link">umd.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>Towson University</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Environmental Science</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - GIS certificate available, sustainability focus</td>
                    <td class="source-link">towson.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>UMBC</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Environmental Science</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Strong ESRI GIS program</td>
                    <td class="source-link">umbc.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>UMBC</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Geography & Environmental Systems</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - ESRI GIS certification track</td>
                    <td class="source-link">umbc.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>Salisbury University</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Environmental Studies</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Renewable energy policy, GIS applications</td>
                    <td class="source-link">salisbury.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>Salisbury University</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Geography & Geosciences</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - GIS focus, environmental applications</td>
                    <td class="source-link">salisbury.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>Frostburg State University</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Wildlife & Fisheries</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Sustainability focus, conservation</td>
                    <td class="source-link">frostburg.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>Frostburg State University</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Geography (GIS concentration)</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - GIS concentration with ESRI tools</td>
                    <td class="source-link">frostburg.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>UMES</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Environmental Science</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Agricultural sustainability, natural resources</td>
                    <td class="source-link">umes.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>Morgan State University</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Civil Engineering (Environmental track)</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Sustainable infrastructure, renewable systems</td>
                    <td class="source-link">morgan.edu</td>
                </tr>
                
                <tr class="sector-4year">
                    <td>Renewable Energy</td>
                    <td>Bowie State University</td>
                    <td>4-Year</td>
                    <td>BS</td>
                    <td>Natural Sciences (Environmental concentration)</td>
                    <td>N/A</td>
                    <td class="credential-yes">Yes - Environmental science concentration</td>
                    <td class="source-link">bowiestate.edu</td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <div class="note">
        <strong>Critical Note:</strong> *Maryland law requires all permanent solar/wind/hydro-electric system installation and maintenance be performed by licensed electricians or registered electrical apprentices. Programs teach theory and design only; hands-on installation requires licensed electrician supervision.
    </div>
    
    <div style="margin-top: 20px; padding: 15px; background-color: #f0f4f8; border-radius: 5px;">
        <h3 style="color: #231F20;">Industry-Recognized Credentials Addressed:</h3>
        <ul>
            <li><strong>OSHA 10-Hour:</strong> General Industry or Construction Safety</li>
            <li><strong>CBLP:</strong> Chesapeake Bay Landscape Professional Certification</li>
            <li><strong>ESRI GIS:</strong> Geographic Information Systems Certification</li>
            <li><strong>Erosion & Sediment Control:</strong> Maryland certification</li>
            <li><strong>Photovoltaic Associate:</strong> Knowledge-based (installation requires electrical license)</li>
        </ul>
    </div>
    <script>
        (function(){
            const table = document.getElementById('enrRenewTable');
            const tbody = table.querySelector('tbody');
            const searchInput = document.getElementById('searchInput');
            let sectorFilter = 'all';

            function linkifySources(){
                tbody.querySelectorAll('td.source-link').forEach(td => {
                    const txt = (td.textContent || '').trim();
                    if (!txt) return;
                    if (td.querySelector('a')) return;
                    const href = txt.startsWith('http') ? txt : `https://${txt}`;
                    const a = document.createElement('a');
                    a.href = href;
                    a.textContent = txt;
                    a.target = '_blank';
                    a.rel = 'noopener';
                    a.style.color = '#1976d2';
                    td.textContent = '';
                    td.appendChild(a);
                });
            }

            function matchesSector(tr){
                if (sectorFilter === 'all') return true;
                if (sectorFilter === '2') return tr.classList.contains('sector-2year');
                if (sectorFilter === '4') return tr.classList.contains('sector-4year');
                return true;
            }

            function matchesSearch(tr){
                const q = (searchInput.value || '').toLowerCase();
                if (!q) return true;
                return tr.textContent.toLowerCase().includes(q);
            }

            function applyFilters(){
                tbody.querySelectorAll('tr').forEach(tr => {
                    const visible = matchesSector(tr) && matchesSearch(tr);
                    tr.style.display = visible ? '' : 'none';
                });
            }

            function exportVisible(){
                const headers = Array.from(table.querySelectorAll('thead th')).map(th => '"' + th.textContent.trim().replace(/"/g,'""') + '"');
                let csv = headers.join(',') + '\n';
                Array.from(tbody.querySelectorAll('tr')).forEach(tr => {
                    if (tr.style.display === 'none') return;
                    const cells = Array.from(tr.querySelectorAll('td')).map(td => '"' + (td.textContent || '').trim().replace(/"/g,'""') + '"');
                    csv += cells.join(',') + '\n';
                });
                const blob = new Blob([csv], {type:'text/csv;charset=utf-8;'});
                const url = URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = 'ENR_Renewable_Energy_Crosswalk.csv';
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
                URL.revokeObjectURL(url);
            }

            // Sorting
            let sortIndex = null, sortAsc = true;
            function applySort(){
                if (sortIndex === null) return;
                const rows = Array.from(tbody.querySelectorAll('tr')).filter(tr => tr.style.display !== 'none');
                rows.sort((a,b) => {
                    const ta = (a.children[sortIndex]?.textContent || '').trim().toLowerCase();
                    const tb = (b.children[sortIndex]?.textContent || '').trim().toLowerCase();
                    return sortAsc ? ta.localeCompare(tb) : tb.localeCompare(ta);
                });
                rows.forEach(r => tbody.appendChild(r));
            }
            (function setupHeaderSort(){
                const ths = table.querySelectorAll('thead th');
                ths.forEach((th, idx) => {
                    th.style.cursor = 'pointer';
                    th.title = 'Click to sort';
                    th.addEventListener('click', () => {
                        if (sortIndex === idx) sortAsc = !sortAsc; else { sortIndex = idx; sortAsc = true; }
                        applySort();
                        updateIndicators();
                    });
                });
            })();
            function updateIndicators(){
                const ths = table.querySelectorAll('thead th');
                ths.forEach((th, idx) => {
                    const base = th.dataset.base || th.textContent.trim();
                    th.dataset.base = base;
                    th.textContent = base + (sortIndex === idx ? (sortAsc ? ' ▲' : ' ▼') : '');
                });
            }

            document.getElementById('showAllBtn').addEventListener('click', () => { sectorFilter = 'all'; applyFilters(); });
            document.getElementById('twoYearBtn').addEventListener('click', () => { sectorFilter = '2'; applyFilters(); });
            document.getElementById('fourYearBtn').addEventListener('click', () => { sectorFilter = '4'; applyFilters(); });
            document.getElementById('exportBtn').addEventListener('click', exportVisible);
            searchInput.addEventListener('input', applyFilters);

            linkifySources();
            applyFilters();
            updateIndicators();
        })();
            // Prevent accidental navigation when dropping files/screenshots onto the page
        window.addEventListener('dragover', function(e){ e.preventDefault(); });
        window.addEventListener('drop', function(e){
            if (e.dataTransfer && e.dataTransfer.files && e.dataTransfer.files.length) {
                e.preventDefault();
                alert('File drop disabled to prevent accidental navigation.');
            }
        });
    </script>
    <button id="feedbackFab" class="fab-pill" aria-label="Open feedback">Feedback</button>
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
                <button id="copyFeedback" style="background:#0ea5e9;">Copy</button>
                <button id="emailFeedback">Email</button>
            </div>
        </div>
    </div>
    <script>
        (function(){
            const fab = document.getElementById('feedbackFab');
            const modal = document.getElementById('modal-feedback');
            function open(){ modal.classList.add('open'); modal.setAttribute('aria-hidden','false'); }
            function close(){ modal.classList.remove('open'); modal.setAttribute('aria-hidden','true'); }
            fab.addEventListener('click', open);
            modal.addEventListener('click', (e)=>{ if (e.target===modal || e.target.hasAttribute('data-close')) close(); });
            document.addEventListener('keydown', (e)=>{ if(e.key==='Escape'){ close(); }});
            function buildFeedbackText(){
                const name=(document.getElementById('fbName')?.value||'').trim();
                const email=(document.getElementById('fbEmail')?.value||'').trim();
                const role=(document.getElementById('fbRole')?.value||'').trim();
                const cat=(document.getElementById('fbCategory')?.value||'').trim();
                const msg=(document.getElementById('fbMessage')?.value||'').trim();
                const page=`${document.title} (${location.href})`;
                return `Name: ${name}\nEmail: ${email}\nRole: ${role}\nCategory: ${cat}\nPage: ${page}\n\nMessage:\n${msg}`.trim();
            }
            document.getElementById('copyFeedback').addEventListener('click', async ()=>{ const txt=buildFeedbackText(); try{ await navigator.clipboard.writeText(txt); alert('Copied to clipboard.'); }catch{} });
            document.getElementById('emailFeedback').addEventListener('click', ()=>{ const cat=(document.getElementById('fbCategory')?.value||'General').trim(); const subj=encodeURIComponent(`CTE Crosswalks Feedback - ${cat}`); const body=encodeURIComponent(buildFeedbackText()); window.location.href=`mailto:occpcteprograms.msde@maryland.gov?subject=${subj}&body=${body}`; });
        })();
    </script>
</body>
</html>
