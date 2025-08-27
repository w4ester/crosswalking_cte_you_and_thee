<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ENR Renewable Energy Crosswalk Analysis</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        h1 {
            color: #2d3748;
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-align: center;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .subtitle {
            text-align: center;
            color: #718096;
            margin-bottom: 30px;
            font-size: 1.1rem;
        }

        .controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .search-box {
            flex: 1;
            min-width: 250px;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 12px 40px 12px 15px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .search-box input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .search-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
        }

        .btn-group {
            display: flex;
            gap: 10px;
        }

        button {
            padding: 12px 24px;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-secondary {
            background: #48bb78;
            color: white;
        }

        .btn-secondary:hover {
            background: #38a169;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(72, 187, 120, 0.3);
        }

        .table-container {
            overflow-x: auto;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
        }

        thead {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e2e8f0;
        }

        tbody tr {
            transition: all 0.3s;
        }

        tbody tr:hover {
            background: #f7fafc;
            transform: scale(1.01);
        }

        .institution-type {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .type-community {
            background: #bee3f8;
            color: #2c5282;
        }

        .type-university {
            background: #c6f6d5;
            color: #22543d;
        }

        .credential-badge {
            display: inline-block;
            padding: 3px 8px;
            margin: 2px;
            border-radius: 5px;
            font-size: 0.85rem;
            background: #faf5ff;
            color: #553c9a;
            border: 1px solid #e9d8fd;
        }

        .certificate-tag {
            display: inline-block;
            padding: 3px 8px;
            margin: 2px;
            border-radius: 5px;
            font-size: 0.85rem;
            background: #fed7d7;
            color: #742a2a;
            font-weight: 600;
        }

        .warning-note {
            background: #fff5f5;
            border-left: 4px solid #fc8181;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }

        .warning-note h3 {
            color: #c53030;
            margin-bottom: 5px;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .stat-label {
            color: #718096;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.8rem;
            }

            .controls {
                flex-direction: column;
            }

            .search-box {
                width: 100%;
            }

            .btn-group {
                width: 100%;
                justify-content: stretch;
            }

            button {
                flex: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ENR Renewable Energy Crosswalk Analysis</h1>
        <p class="subtitle">Maryland Educational Programs & Industry Credentials</p>

        <div class="stats">
            <div class="stat-card">
                <div class="stat-number" id="totalPrograms">0</div>
                <div class="stat-label">Total Programs</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="communityColleges">0</div>
                <div class="stat-label">Community Colleges</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="universities">0</div>
                <div class="stat-label">Universities</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="certificatePrograms">0</div>
                <div class="stat-label">Certificate Programs</div>
            </div>
        </div>

        <div class="controls">
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Search programs, institutions, or credentials...">
                <span class="search-icon">🔍</span>
            </div>
            <div class="btn-group">
                <button class="btn-secondary" onclick="filterTable('all')">Show All</button>
                <button class="btn-secondary" onclick="filterTable('community')">Community Colleges</button>
                <button class="btn-secondary" onclick="filterTable('university')">Universities</button>
                <button class="btn-primary" onclick="exportToExcel()">📊 Export to Excel</button>
            </div>
        </div>

        <div class="warning-note">
            <h3>⚠️ Critical Note on Electrical Work</h3>
            <p>Maryland law requires all permanent solar/wind/hydro-electric system installation and maintenance be performed by licensed electricians or registered electrical apprentices. Community college programs teach theory and design; hands-on installation is demonstration only unless supervised by licensed electrician.</p>
        </div>

        <div class="table-container">
            <table id="dataTable">
                <thead>
                    <tr>
                        <th>Institution</th>
                        <th>Type</th>
                        <th>Program/Degree</th>
                        <th>Certificates (LDC)</th>
                        <th>Key Features</th>
                        <th>Industry Credentials Aligned</th>
                    </tr>
                </thead>
                <tbody id="tableBody">
                    <!-- Table content will be populated by JavaScript -->
                </tbody>
            </table>
        </div>
    </div>

    <script>
        const programData = [
            // Community Colleges
            {
                institution: "Anne Arundel CC (AACC)",
                type: "Community College",
                program: "Environmental Science AS",
                certificates: "Renewable Energy Certificate",
                features: "GIS applications, sustainability practices, OSHA safety training",
                credentials: "OSHA 10, ESRI GIS"
            },
            {
                institution: "Montgomery College (MC)",
                type: "Community College",
                program: "Environmental Science & Policy AS",
                certificates: "Renewable Energy Technology Certificate",
                features: "Solar PV theory, environmental monitoring, OSHA 10 preparation",
                credentials: "OSHA 10, Photovoltaic Associate"
            },
            {
                institution: "Howard CC (HCC)",
                type: "Community College",
                program: "Environmental Science AS (transfer)",
                certificates: "",
                features: "GIS mapping, conservation techniques",
                credentials: "ESRI GIS"
            },
            {
                institution: "Prince George's CC (PGCC)",
                type: "Community College",
                program: "Environmental Science Technology AAS",
                certificates: "Sustainable Energy Certificate",
                features: "Renewable energy systems, environmental assessment",
                credentials: ""
            },
            {
                institution: "College of Southern Maryland (CSM)",
                type: "Community College",
                program: "Environmental Science AS",
                certificates: "",
                features: "Chesapeake Bay watershed studies, GIS applications",
                credentials: "CBLP Certification, ESRI GIS"
            },
            {
                institution: "Harford CC",
                type: "Community College",
                program: "Environmental Studies AS",
                certificates: "",
                features: "Field research methods, sustainability practices, Chesapeake Bay watershed management",
                credentials: "CBLP Certification"
            },
            {
                institution: "Frederick CC",
                type: "Community College",
                program: "Alternative Energy Technology AAS",
                certificates: "Solar Energy Installation Certificate",
                features: "NEC Article 690 compliance for solar systems (theory only), requires licensed electrician supervision",
                credentials: ""
            },
            {
                institution: "Cecil College",
                type: "Community College",
                program: "Environmental Science AS",
                certificates: "",
                features: "Natural resource management, GIS mapping",
                credentials: "ESRI GIS"
            },
            // Universities
            {
                institution: "University of Maryland, College Park",
                type: "University",
                program: "BS Environmental Science & Technology",
                certificates: "",
                features: "Renewable energy systems, GIS certification pathway, sustainability engineering, Chesapeake Bay ecosystem studies, erosion control principles",
                credentials: "ESRI GIS, CBLP Certification, Erosion & Sediment Control"
            },
            {
                institution: "Towson University",
                type: "University",
                program: "BS Environmental Science",
                certificates: "GIS Certificate available",
                features: "Concentrations in environmental biology and sustainability",
                credentials: "ESRI GIS"
            },
            {
                institution: "UMBC",
                type: "University",
                program: "BS Environmental Science, BS Geography & Environmental Systems",
                certificates: "",
                features: "Strong GIS program with ESRI certification alignment, dedicated GIS certification track",
                credentials: "ESRI GIS"
            },
            {
                institution: "Salisbury University",
                type: "University",
                program: "BS Environmental Studies, BS Geography & Geosciences",
                certificates: "",
                features: "Renewable energy policy, GIS applications",
                credentials: "ESRI GIS"
            },
            {
                institution: "Frostburg State University",
                type: "University",
                program: "BS Wildlife & Fisheries, BS Geography",
                certificates: "",
                features: "Sustainability focus, GIS concentration",
                credentials: "ESRI GIS"
            },
            {
                institution: "University of Maryland Eastern Shore (UMES)",
                type: "University",
                program: "BS Environmental Science",
                certificates: "",
                features: "Agricultural sustainability, natural resource management",
                credentials: ""
            },
            {
                institution: "Morgan State University",
                type: "University",
                program: "BS Civil Engineering (environmental engineering track)",
                certificates: "",
                features: "Sustainable infrastructure, renewable energy systems",
                credentials: ""
            },
            {
                institution: "Bowie State University",
                type: "University",
                program: "BS Natural Sciences (environmental science concentration)",
                certificates: "",
                features: "Environmental science concentration",
                credentials: ""
            }
        ];

        function populateTable() {
            const tableBody = document.getElementById('tableBody');
            tableBody.innerHTML = '';
            
            programData.forEach(row => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td><strong>${row.institution}</strong></td>
                    <td><span class="institution-type ${row.type === 'Community College' ? 'type-community' : 'type-university'}">${row.type}</span></td>
                    <td>${row.program}</td>
                    <td>${row.certificates ? `<span class="certificate-tag">${row.certificates}</span>` : '-'}</td>
                    <td>${row.features}</td>
                    <td>${row.credentials ? row.credentials.split(',').map(c => `<span class="credential-badge">${c.trim()}</span>`).join('') : '-'}</td>
                `;
                tableBody.appendChild(tr);
            });
            
            updateStats();
        }

        function updateStats() {
            document.getElementById('totalPrograms').textContent = programData.length;
            document.getElementById('communityColleges').textContent = programData.filter(p => p.type === 'Community College').length;
            document.getElementById('universities').textContent = programData.filter(p => p.type === 'University').length;
            document.getElementById('certificatePrograms').textContent = programData.filter(p => p.certificates !== '').length;
        }

        function filterTable(type) {
            const rows = document.querySelectorAll('#tableBody tr');
            rows.forEach(row => {
                if (type === 'all') {
                    row.style.display = '';
                } else if (type === 'community') {
                    row.style.display = row.innerHTML.includes('type-community') ? '' : 'none';
                } else if (type === 'university') {
                    row.style.display = row.innerHTML.includes('type-university') ? '' : 'none';
                }
            });
        }

        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('#tableBody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });

        function exportToExcel() {
            let csvContent = "Institution,Type,Program/Degree,Certificates,Key Features,Industry Credentials\n";
            
            programData.forEach(row => {
                csvContent += `"${row.institution}","${row.type}","${row.program}","${row.certificates || '-'}","${row.features}","${row.credentials || '-'}"\n`;
            });
            
            const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            const url = URL.createObjectURL(blob);
            link.setAttribute('href', url);
            link.setAttribute('download', 'ENR_Renewable_Energy_Crosswalk.csv');
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }

        // Initialize table on page load
        populateTable();
    </script>
</body>
</html>