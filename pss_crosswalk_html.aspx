<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Robust drop prevention (capture-level) -->
    <script>(function(){function block(e){e.preventDefault();e.stopPropagation();}window.addEventListener('dragover',block,{capture:true});window.addEventListener('drop',block,{capture:true});document.addEventListener('dragover',block,{capture:true});document.addEventListener('drop',block,{capture:true});})();</script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PSS Cluster Crosswalk - Maryland Postsecondary Programs</title>
    
    <!-- SheetJS Library for Excel Export -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    
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
            max-width: 1400px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        
        .header {
            background: transparent;
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #BD0934, #FFC838);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .header p {
            font-size: 1.2em;
            opacity: 0.95;
        }
        /* Top cluster nav */
        .top-nav { display:flex; justify-content:center; position: sticky; top: 0; z-index: 300; }
        .quick-jump { display:flex; flex-wrap:wrap; gap:10px; background:#fff; border:1px solid #e2e8f0; border-radius:999px; padding:6px 10px; box-shadow:0 1px 4px rgba(0,0,0,0.06); margin: 10px auto; }
        .quick-jump a { display:inline-block; padding:6px 10px; background:#231F20; color:#fff; text-decoration:none; border-radius:999px; font-size:0.9rem; transition:opacity .2s ease; }
        .quick-jump a:hover { opacity:.9; }
        .quick-jump a.active { background: linear-gradient(135deg, #BD0934, #FFC838); }
        
        .controls {
            padding: 20px 30px;
            background: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .filter-group {
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
        }
        
        select, input[type="text"] {
            padding: 10px 15px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: white;
        }
        
        select:focus, input[type="text"]:focus {
            outline: none;
            border-color: #BD0934;
            box-shadow: 0 0 0 3px rgba(189, 9, 52, 0.1);
        }
        
        button {
            padding: 12px 25px;
            background: linear-gradient(135deg, #BD0934 0%, #FFC838 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(189, 9, 52, 0.4);
        }
        
        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(189, 9, 52, 0.6);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }
        
        .btn-success {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }
        
        .table-container {
            padding: 20px;
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 14px;
        }
        
        thead {
            background: linear-gradient(135deg, #BD0934 0%, #FFC838 100%);
            color: white;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        
        th {
            padding: 15px 10px;
            text-align: left;
            font-weight: 600;
            letter-spacing: 0.5px;
            border-bottom: none;
        }
        
        td {
            padding: 12px 10px;
            border-bottom: 1px solid #e2e8f0;
        }
        
        tbody tr {
            transition: all 0.3s ease;
        }
        
        tbody tr:hover {
            background: #E2E3E4;
        }
        
        tbody tr:nth-child(even) {
            background: #f8f9fa;
        }
        
        .program-cell {
            font-weight: 600;
            color: #2c3e50;
        }
        
        .institution-cell {
            color: #3498db;
            font-weight: 500;
        }
        
        .sector-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }
        
        .sector-cc {
            background: #e3f2fd;
            color: #1976d2;
        }
        
        .sector-4year {
            background: #f3e5f5;
            color: #7b1fa2;
        }
        
        .cert-yes {
            color: #27ae60;
            font-weight: 600;
        }
        
        .cert-partial {
            color: #f39c12;
            font-weight: 600;
        }
        
        .stats {
            padding: 20px 30px;
            background: #f8f9fa;
            border-top: 2px solid #dee2e6;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .stat-card {
            text-align: center;
            padding: 15px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            min-width: 150px;
        }
        
        .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #BD0934;
        }
        
        .stat-label {
            color: #231F20;
            margin-top: 5px;
        }
        
        a {
            color: #3498db;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        @media print {
            body {
                background: white;
                padding: 0;
            }
            
            .container {
                box-shadow: none;
                border-radius: 0;
            }
            
            .controls, .stats {
                display: none;
            }
            
            table {
                font-size: 10px;
            }
            
            th, td {
                padding: 5px;
            }
        }
        
        .loading {
            text-align: center;
            padding: 40px;
            font-size: 1.2em;
            color: #231F20;
        }
    </style>
</head>
<body>
    <nav class="top-nav">
        <div class="quick-jump">
            <a href="index.aspx">Home</a>
            <a href="dt-crosswalk-table.aspx">Digital Technology</a>
            <a href="003_ed_crosswalk-table.aspx">Education</a>
            <a href="enr-crosswalk-table.aspx">ENR General</a>
            <a href="003_table_enr_renewable_energy_crosswalk_table.aspx">ENR Renewable</a>
            <a href="pss_crosswalk_html.aspx" class="active">PSS</a>
        </div>
    </nav>
    <div class="container">
        <div class="header">
            <h1>PSS Cluster Postsecondary Crosswalk</h1>
            <p>Maryland Public Safety & Security Programs Alignment</p>
        </div>
        <div style="text-align:center; margin-bottom: 10px; color:#231F20; font-size:0.95rem;">
            <a href="index.aspx">Home</a> &gt; PSS
        </div>
        
        <div class="controls">
            <div class="filter-group">
                <select id="programFilter">
                    <option value="">All Programs</option>
                    <option value="Criminal Justice & Law Enforcement">Criminal Justice & Law Enforcement</option>
                    <option value="Emergency Medical Technician">Emergency Medical Technician</option>
                    <option value="Emergency Response">Emergency Response</option>
                    <option value="Fire Fighter">Fire Fighter</option>
                    <option value="JROTC">JROTC</option>
                </select>
                
                <select id="sectorFilter">
                    <option value="">All Sectors</option>
                    <option value="Community College">Community College</option>
                    <option value="4-Year University">4-Year University</option>
                </select>
                
                <input type="text" id="searchInput" placeholder="Search institutions, programs...">
            </div>
            
            <div class="filter-group">
                <button onclick="resetFilters()" class="btn-secondary">Reset Filters</button>
                <button onclick="exportToExcel()" class="btn-success">📥 Export to Excel</button>
                <button onclick="window.print()">🖨️ Print</button>
            </div>
        </div>
        
        <div class="table-container">
            <div class="loading">Loading data...</div>
            <table id="dataTable" style="display: none;">
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
                <tbody id="tableBody">
                </tbody>
            </table>
        </div>
        
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number" id="totalRecords">0</div>
                <div class="stat-label">Total Records</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="ccCount">0</div>
                <div class="stat-label">Community Colleges</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="uniCount">0</div>
                <div class="stat-label">4-Year Universities</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="certCount">0</div>
                <div class="stat-label">With Certificates</div>
            </div>
        </div>
    </div>
    
    <script>
        // Data array - populated with all PSS programs
        let allData = [];
        let filteredData = [];
        
        // Initialize data
        function initializeData() {
            allData = [
                // Criminal Justice & Law Enforcement - Community Colleges
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Anne Arundel Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate, Police Academy Certificate",
                    credentials: "Yes - CPR/First Aid, NIMS",
                    source: "https://www.aacc.edu/programs-and-courses/credit/areas-of-study/criminal-justice/"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Montgomery College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate, Law Enforcement Certificate",
                    credentials: "Yes - CERT, NIMS",
                    source: "https://www.montgomerycollege.edu/academics/programs/criminal-justice/"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Community College of Baltimore County",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice / Law Enforcement Administration",
                    certificates: "Criminal Justice Certificate, Police Academy Certificate",
                    credentials: "Yes - CPR/First Aid, NIMS ICS-100/200",
                    source: "https://www.ccbcmd.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Prince George's Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate, Homeland Security Certificate",
                    credentials: "Yes - NIMS certifications",
                    source: "https://www.pgcc.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Howard Community College",
                    sector: "Community College",
                    degree: "AA",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate",
                    credentials: "Yes - LPSILC aligned training",
                    source: "https://www.howardcc.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "College of Southern Maryland",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate, Corrections Certificate",
                    credentials: "Yes - CPR/First Aid, CERT",
                    source: "https://www.csmd.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Harford Community College",
                    sector: "Community College",
                    degree: "AAS/AA",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate, Law Enforcement Certificate",
                    credentials: "Yes - NIMS, CPR/First Aid",
                    source: "https://www.harford.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Frederick Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Studies Certificate",
                    credentials: "Yes - CERT, NIMS",
                    source: "https://www.frederick.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Wor-Wic Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate",
                    credentials: "Partial",
                    source: "https://www.worwic.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Carroll Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Criminal Justice",
                    certificates: "Criminal Justice Certificate",
                    credentials: "Partial",
                    source: "https://www.carrollcc.edu"
                },
                
                // Criminal Justice & Law Enforcement - 4-Year Universities
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "University of Maryland, College Park",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminology and Criminal Justice",
                    certificates: "",
                    credentials: "Partial - through partnerships",
                    source: "https://ccjs.umd.edu/"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Towson University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice / Homeland Security Studies",
                    certificates: "",
                    credentials: "Yes - NIMS/ICS, CERT",
                    source: "https://www.towson.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "University of Baltimore",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice / Forensic Studies",
                    certificates: "",
                    credentials: "Yes - MPCTC standards aligned",
                    source: "https://www.ubalt.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Salisbury University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.salisbury.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Bowie State University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.bowiestate.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Coppin State University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice / Applied Criminal Justice",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.coppin.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Frostburg State University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Law and Society",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.frostburg.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "University of Maryland Eastern Shore",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.umes.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Morgan State University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.morgan.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "Stevenson University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice / Legal Studies",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.stevenson.edu"
                },
                {
                    program: "Criminal Justice & Law Enforcement",
                    institution: "McDaniel College",
                    sector: "4-Year University",
                    degree: "BA",
                    major: "Criminology",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.mcdaniel.edu"
                },
                
                // Emergency Medical Technician - Community Colleges
                {
                    program: "Emergency Medical Technician",
                    institution: "Anne Arundel Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services",
                    certificates: "EMT Certificate, Paramedic Certificate",
                    credentials: "Yes - MIEMSS EMR/EMT, OSHA 10, NFPA Hazmat",
                    source: "https://www.aacc.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Montgomery College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science & Emergency Services",
                    certificates: "Emergency Medical Technician Certificate, Fire Science Certificate",
                    credentials: "Yes - NREMT, MIEMSS, NFPA standards",
                    source: "https://www.montgomerycollege.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Community College of Baltimore County",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services",
                    certificates: "EMT-Basic Certificate, EMT-Intermediate Certificate, Paramedic Certificate",
                    credentials: "Yes - MIEMSS, OSHA 10, NFPA Hazmat",
                    source: "https://www.ccbcmd.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "College of Southern Maryland",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services",
                    certificates: "EMT Certificate, Advanced EMT Certificate",
                    credentials: "Yes - MIEMSS approved, OSHA, NFPA",
                    source: "https://www.csmd.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Howard Community College",
                    sector: "Community College",
                    degree: "AAS/AA",
                    major: "Emergency Medical Services",
                    certificates: "EMT Certificate, Paramedic Certificate",
                    credentials: "Yes - MIEMSS, OSHA 10, NFPA",
                    source: "https://www.howardcc.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Frederick Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services",
                    certificates: "EMT Certificate, Paramedic Certificate",
                    credentials: "Yes - MIEMSS, OSHA 10, NFPA",
                    source: "https://www.frederick.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Hagerstown Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services",
                    certificates: "EMT-Basic Certificate",
                    credentials: "Yes - MIEMSS approved",
                    source: "https://www.hagerstowncc.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Carroll Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services Technology",
                    certificates: "EMT Certificate",
                    credentials: "Yes - MIEMSS approved",
                    source: "https://www.carrollcc.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Chesapeake College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services",
                    certificates: "EMT Certificate, Paramedic Certificate",
                    credentials: "Yes - MIEMSS, OSHA, NFPA",
                    source: "https://www.chesapeake.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Wor-Wic Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Medical Services",
                    certificates: "EMT Certificate",
                    credentials: "Yes - MIEMSS approved",
                    source: "https://www.worwic.edu"
                },
                
                // Emergency Medical Technician - 4-Year Universities
                {
                    program: "Emergency Medical Technician",
                    institution: "University of Maryland, Baltimore County",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Emergency Health Services",
                    certificates: "",
                    credentials: "Yes - NREMT preparation, OSHA, NFPA",
                    source: "https://ehs.umbc.edu/"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Towson University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Health Science - Emergency Management track",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.towson.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "University of Maryland, College Park",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Fire Protection Engineering",
                    certificates: "",
                    credentials: "Partial - emergency response components",
                    source: "https://fpe.umd.edu/"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Frostburg State University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Health Science - Emergency Management",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.frostburg.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Salisbury University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Community Health - Emergency & Disaster Management",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.salisbury.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Capitol Technology University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Emergency and Protective Services Management",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.captechu.edu"
                },
                {
                    program: "Emergency Medical Technician",
                    institution: "Johns Hopkins University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Public Health Studies - Emergency Preparedness",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://publichealth.jhu.edu/"
                },
                
                // Emergency Response - Community Colleges
                {
                    program: "Emergency Response",
                    institution: "Anne Arundel Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Homeland Security & Criminal Justice",
                    certificates: "Emergency Management Certificate, Homeland Security Certificate",
                    credentials: "Yes - FEMA PDS, CERT",
                    source: "https://www.aacc.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Montgomery College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science & Emergency Services",
                    certificates: "Emergency Management Certificate, Disaster Response Certificate",
                    credentials: "Yes - CERT, FEMA PDS",
                    source: "https://www.montgomerycollege.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Frederick Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Management",
                    certificates: "Emergency Preparedness Certificate, Business Continuity Certificate",
                    credentials: "Yes - FEMA PDS (all 7 courses), CERT",
                    source: "https://www.frederick.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Community College of Baltimore County",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Management",
                    certificates: "Emergency Planning Certificate, Homeland Security Certificate",
                    credentials: "Yes - FEMA Independent Study, CERT",
                    source: "https://www.ccbcmd.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "College of Southern Maryland",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Public Safety Administration",
                    certificates: "Emergency Management Certificate",
                    credentials: "Yes - CERT through county partnership",
                    source: "https://www.csmd.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Howard Community College",
                    sector: "Community College",
                    degree: "AAS/AA",
                    major: "Emergency Management",
                    certificates: "Disaster Preparedness Certificate",
                    credentials: "Yes - FEMA PDS, CERT Train-the-Trainer",
                    source: "https://www.howardcc.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Prince George's Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Homeland Security",
                    certificates: "Emergency Management Certificate, Critical Infrastructure Protection Certificate",
                    credentials: "Yes - FEMA PDS required, CERT",
                    source: "https://www.pgcc.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Harford Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Homeland Security & Emergency Management",
                    certificates: "Emergency Response Certificate",
                    credentials: "Yes - CERT, FEMA courses",
                    source: "https://www.harford.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Carroll Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Emergency Management",
                    certificates: "Emergency Planning Certificate",
                    credentials: "Partial",
                    source: "https://www.carrollcc.edu"
                },
                
                // Emergency Response - 4-Year Universities
                {
                    program: "Emergency Response",
                    institution: "University of Maryland, College Park",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Fire Protection Engineering - Emergency Management focus",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://fpe.umd.edu/"
                },
                {
                    program: "Emergency Response",
                    institution: "Towson University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Homeland Security Studies / Emergency Management",
                    certificates: "",
                    credentials: "Yes - FEMA PDS, CERT instructor",
                    source: "https://www.towson.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "University of Maryland Global Campus",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Homeland Security / Emergency Management",
                    certificates: "",
                    credentials: "Yes - FEMA EMAP standards, PDS",
                    source: "https://www.umgc.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "University of Baltimore",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Government & Public Policy - Emergency Management",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.ubalt.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Frostburg State University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Health Science - Emergency Management",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.frostburg.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Capitol Technology University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Emergency and Protective Services Management / Critical Infrastructure",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.captechu.edu"
                },
                {
                    program: "Emergency Response",
                    institution: "Johns Hopkins University",
                    sector: "4-Year University",
                    degree: "BS/MS",
                    major: "Public Health Studies - Emergency Preparedness & Response",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://publichealth.jhu.edu/"
                },
                {
                    program: "Emergency Response",
                    institution: "Stevenson University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Criminal Justice - Homeland Security & Emergency Management",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.stevenson.edu"
                },
                
                // Fire Fighter - Community Colleges
                {
                    program: "Fire Fighter",
                    institution: "Anne Arundel Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science",
                    certificates: "Fire Fighter Certificate, Fire Officer Certificate",
                    credentials: "Yes - MFRI Fire Fighter I/II, NFPA Hazmat, OSHA 10",
                    source: "https://www.aacc.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Montgomery College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science & Emergency Services",
                    certificates: "Fire Fighter I Certificate, Fire Fighter II Certificate, Fire Officer Certificate",
                    credentials: "Yes - MFRI approved, NFPA 1001, Hazmat, OSHA, EMT",
                    source: "https://www.montgomerycollege.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Community College of Baltimore County",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Service Technology",
                    certificates: "Fire Fighter Certificate, Fire Inspector Certificate",
                    credentials: "Yes - MFRI Fire Fighter I/II, NFPA Hazmat, OSHA 10, EMR",
                    source: "https://www.ccbcmd.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Frederick Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science",
                    certificates: "Fire Fighter I & II Certificate, Fire Investigation Certificate",
                    credentials: "Yes - MFRI certifications, NFPA Hazmat, OSHA 10, EMT pathway",
                    source: "https://www.frederick.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "College of Southern Maryland",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science & Emergency Services",
                    certificates: "Fire Fighter Certificate, Fire Officer Certificate",
                    credentials: "Yes - MFRI approved, NFPA 1001, Hazmat, OSHA, EMT option",
                    source: "https://www.csmd.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Prince George's Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science",
                    certificates: "Fire Fighter I Certificate, Fire Fighter II Certificate",
                    credentials: "Yes - MFRI accredited, NFPA Hazmat, OSHA 10, EMR",
                    source: "https://www.pgcc.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Hagerstown Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science Technology",
                    certificates: "Fire Fighter Certificate",
                    credentials: "Yes - MFRI aligned",
                    source: "https://www.hagerstowncc.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Howard Community College",
                    sector: "Community College",
                    degree: "AAS/AA",
                    major: "Fire Science",
                    certificates: "Fire Fighter Certificate",
                    credentials: "Yes - Fire Fighter Fundamentals, MFRI I/II, NFPA Hazmat, OSHA 10",
                    source: "https://www.howardcc.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Harford Community College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science",
                    certificates: "Fire Fighter I & II Certificate",
                    credentials: "Yes - MFRI aligned",
                    source: "https://www.harford.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Cecil College",
                    sector: "Community College",
                    degree: "AAS",
                    major: "Fire Science Technology",
                    certificates: "Fire Fighter Certificate",
                    credentials: "Partial",
                    source: "https://www.cecil.edu"
                },
                
                // Fire Fighter - 4-Year Universities
                {
                    program: "Fire Fighter",
                    institution: "University of Maryland, College Park",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Fire Protection Engineering",
                    certificates: "",
                    credentials: "Yes - NFPA standards, MFRI partnership, Hazmat, OSHA",
                    source: "https://fpe.umd.edu/"
                },
                {
                    program: "Fire Fighter",
                    institution: "University of Maryland Global Campus",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Fire Science / Emergency Management - Fire Service",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.umgc.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "University of Maryland Eastern Shore",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Emergency Medical Services - Fire Science track",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.umes.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Frostburg State University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Health Science - Fire Science concentration",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.frostburg.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Capitol Technology University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Emergency and Protective Services Management - Fire Service",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.captechu.edu"
                },
                {
                    program: "Fire Fighter",
                    institution: "Stevenson University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Business & Technology Management - Fire Service Administration",
                    certificates: "",
                    credentials: "Partial",
                    source: "https://www.stevenson.edu"
                },
                
                // JROTC - Community Colleges
                {
                    program: "JROTC",
                    institution: "Anne Arundel Community College",
                    sector: "Community College",
                    degree: "AA",
                    major: "Military Studies",
                    certificates: "Leadership Certificate",
                    credentials: "Leadership development focus",
                    source: "https://www.aacc.edu"
                },
                {
                    program: "JROTC",
                    institution: "Montgomery College",
                    sector: "Community College",
                    degree: "AA",
                    major: "General Studies - Military Leadership track",
                    certificates: "Leadership Development Certificate",
                    credentials: "Leadership development focus",
                    source: "https://www.montgomerycollege.edu"
                },
                {
                    program: "JROTC",
                    institution: "Community College of Baltimore County",
                    sector: "Community College",
                    degree: "AA",
                    major: "General Studies - Public Service",
                    certificates: "Military Leadership Certificate (ROTC partnership)",
                    credentials: "Leadership development focus",
                    source: "https://www.ccbcmd.edu"
                },
                {
                    program: "JROTC",
                    institution: "Prince George's Community College",
                    sector: "Community College",
                    degree: "AA",
                    major: "General Studies - Military Science track",
                    certificates: "Leadership Certificate",
                    credentials: "Leadership development focus",
                    source: "https://www.pgcc.edu"
                },
                {
                    program: "JROTC",
                    institution: "College of Southern Maryland",
                    sector: "Community College",
                    degree: "AA",
                    major: "General Studies - Leadership concentration",
                    certificates: "Military Leadership Certificate (ROTC partnership)",
                    credentials: "Leadership development focus",
                    source: "https://www.csmd.edu"
                },
                {
                    program: "JROTC",
                    institution: "Frederick Community College",
                    sector: "Community College",
                    degree: "AA",
                    major: "General Studies - Military Studies option",
                    certificates: "",
                    credentials: "Leadership development focus",
                    source: "https://www.frederick.edu"
                },
                {
                    program: "JROTC",
                    institution: "Harford Community College",
                    sector: "Community College",
                    degree: "AA",
                    major: "General Studies - Military Science (Aberdeen Proving Ground partnership)",
                    certificates: "",
                    credentials: "Leadership development focus",
                    source: "https://www.harford.edu"
                },
                
                // JROTC - 4-Year Universities with ROTC
                {
                    program: "JROTC",
                    institution: "University of Maryland, College Park",
                    sector: "4-Year University",
                    degree: "Military Science Minor",
                    major: "Army ROTC, Air Force ROTC, Navy ROTC",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.armyrotc.umd.edu/"
                },
                {
                    program: "JROTC",
                    institution: "Towson University",
                    sector: "4-Year University",
                    degree: "Military Science Minor",
                    major: "Army ROTC",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.towson.edu"
                },
                {
                    program: "JROTC",
                    institution: "Morgan State University",
                    sector: "4-Year University",
                    degree: "Military Science Minor",
                    major: "Army ROTC Bear Battalion",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.morgan.edu/rotc"
                },
                {
                    program: "JROTC",
                    institution: "Loyola University Maryland",
                    sector: "4-Year University",
                    degree: "Military Science",
                    major: "Army ROTC Greyhound Battalion",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.loyola.edu"
                },
                {
                    program: "JROTC",
                    institution: "Johns Hopkins University",
                    sector: "4-Year University",
                    degree: "Military Science",
                    major: "Army ROTC, Air Force ROTC, Navy ROTC (cross-enrollment)",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://studentaffairs.jhu.edu"
                },
                {
                    program: "JROTC",
                    institution: "McDaniel College",
                    sector: "4-Year University",
                    degree: "Military Science Minor",
                    major: "Army ROTC Green Terror Battalion",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.mcdaniel.edu"
                },
                {
                    program: "JROTC",
                    institution: "University of Maryland Baltimore County",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Emergency Health Services - Military Medicine track (UMD ROTC)",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://ehs.umbc.edu/"
                },
                {
                    program: "JROTC",
                    institution: "Bowie State University",
                    sector: "4-Year University",
                    degree: "Military Science Minor",
                    major: "Army ROTC (Howard University partnership)",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.bowiestate.edu"
                },
                {
                    program: "JROTC",
                    institution: "Capitol Technology University",
                    sector: "4-Year University",
                    degree: "BS",
                    major: "Cybersecurity - Military Cyber Operations (Army ROTC partnership)",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.captechu.edu"
                },
                {
                    program: "JROTC",
                    institution: "Salisbury University",
                    sector: "4-Year University",
                    degree: "Military Science Minor",
                    major: "Army ROTC partnership",
                    certificates: "",
                    credentials: "Officer commissioning pathway",
                    source: "https://www.salisbury.edu"
                }
            ];
            
            filteredData = [...allData];
            displayData();
            updateStats();
        }
        
        // Display data in table
        function displayData() {
            const tbody = document.getElementById('tableBody');
            tbody.innerHTML = '';
            
            filteredData.forEach(row => {
                const tr = document.createElement('tr');
                
                // Format sector badge
                const sectorClass = row.sector === 'Community College' ? 'sector-cc' : 'sector-4year';
                const sectorBadge = `<span class="sector-badge ${sectorClass}">${row.sector}</span>`;
                
                // Format credentials
                let credClass = '';
                if (row.credentials.startsWith('Yes')) credClass = 'cert-yes';
                else if (row.credentials === 'Partial') credClass = 'cert-partial';
                
                tr.innerHTML = `
                    <td class="program-cell">${row.program}</td>
                    <td class="institution-cell">${row.institution}</td>
                    <td>${sectorBadge}</td>
                    <td>${row.degree}</td>
                    <td>${row.major}</td>
                    <td>${row.certificates || '-'}</td>
                    <td class="${credClass}">${row.credentials}</td>
                    <td><a href="${row.source}" target="_blank">View</a></td>
                `;
                
                tbody.appendChild(tr);
            });
            
            // Show table, hide loading
            document.querySelector('.loading').style.display = 'none';
            document.getElementById('dataTable').style.display = 'table';
        }
        
        // Filter functions
        function applyFilters() {
            const programFilter = document.getElementById('programFilter').value;
            const sectorFilter = document.getElementById('sectorFilter').value;
            const q = document.getElementById('searchInput').value.toLowerCase().trim();
            const tokens = q.split(/\s+/).filter(Boolean);
            
            filteredData = allData.filter(row => {
                const matchProgram = !programFilter || row.program === programFilter;
                const matchSector = !sectorFilter || row.sector === sectorFilter;
                const text = (row.program + ' ' + row.institution + ' ' + row.sector + ' ' + row.degree + ' ' + row.major + ' ' + (row.certificates||'') + ' ' + (row.credentials||'')).toLowerCase();
                const matchSearch = tokens.length === 0 || tokens.every(t => text.includes(t));
                return matchProgram && matchSector && matchSearch;
            });
            
            displayData();
            updateStats();
        }
        
        // Reset filters
        function resetFilters() {
            document.getElementById('programFilter').value = '';
            document.getElementById('sectorFilter').value = '';
            document.getElementById('searchInput').value = '';
            filteredData = [...allData];
            displayData();
            updateStats();
        }
        
        // Update statistics
        function updateStats() {
            document.getElementById('totalRecords').textContent = filteredData.length;
            
            const ccCount = filteredData.filter(r => r.sector === 'Community College').length;
            const uniCount = filteredData.filter(r => r.sector === '4-Year University').length;
            const certCount = filteredData.filter(r => r.certificates && r.certificates !== '').length;
            
            document.getElementById('ccCount').textContent = ccCount;
            document.getElementById('uniCount').textContent = uniCount;
            document.getElementById('certCount').textContent = certCount;
        }
        
        // Export to Excel
        function exportToExcel() {
            // Prepare data for export
            const exportData = filteredData.map(row => ({
                'High School Program': row.program,
                'Institution': row.institution,
                'Sector': row.sector,
                'Degree': row.degree,
                'Program/Major': row.major,
                'Lower Division Certificates': row.certificates || '',
                'Credential Content in Major?': row.credentials,
                'Source': row.source
            }));
            
            // Create workbook
            const ws = XLSX.utils.json_to_sheet(exportData);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "PSS Crosswalk");
            
            // Set column widths
            const cols = [
                { wch: 35 }, // High School Program
                { wch: 40 }, // Institution
                { wch: 20 }, // Sector
                { wch: 10 }, // Degree
                { wch: 45 }, // Program/Major
                { wch: 50 }, // Lower Division Certificates
                { wch: 30 }, // Credential Content
                { wch: 50 }  // Source
            ];
            ws['!cols'] = cols;
            
            // Generate filename with date
            const date = new Date().toISOString().split('T')[0];
            const filename = `PSS_Crosswalk_${date}.xlsx`;
            
            // Save file
            XLSX.writeFile(wb, filename);
        }
        
        // Event listeners
        document.addEventListener('DOMContentLoaded', function() {
            initializeData();
            
            // Add event listeners for filters
            document.getElementById('programFilter').addEventListener('change', applyFilters);
            document.getElementById('sectorFilter').addEventListener('change', applyFilters);
            document.getElementById('searchInput').addEventListener('input', applyFilters);
        });
    </script>
</body>
</html>
