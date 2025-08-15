<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital Technology Cluster Crosswalk Analysis</title>
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
            max-width: 1600px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.97);
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

        .program-selector {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .program-btn {
            padding: 12px 20px;
            border: 2px solid #667eea;
            background: white;
            color: #667eea;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .program-btn:before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            transition: left 0.3s;
            z-index: -1;
        }

        .program-btn:hover:before,
        .program-btn.active:before {
            left: 0;
        }

        .program-btn:hover,
        .program-btn.active {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
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
            font-size: 0.9rem;
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
            flex-wrap: wrap;
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
            margin-bottom: 30px;
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
            white-space: nowrap;
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

        .program-type {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            margin-right: 5px;
        }

        .type-programming {
            background: #faf5ff;
            color: #553c9a;
        }

        .type-cybersecurity {
            background: #fee2e2;
            color: #991b1b;
        }

        .type-ml {
            background: #fef3c7;
            color: #92400e;
        }

        .type-networking {
            background: #dbeafe;
            color: #1e40af;
        }

        .credential-badge {
            display: inline-block;
            padding: 3px 8px;
            margin: 2px;
            border-radius: 5px;
            font-size: 0.85rem;
            background: #f0f4f8;
            color: #2d3748;
            border: 1px solid #cbd5e0;
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

        .info-box {
            background: #edf2f7;
            border-left: 4px solid #667eea;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }

        .info-box h3 {
            color: #2d3748;
            margin-bottom: 10px;
        }

        .info-box ul {
            margin-left: 20px;
            color: #4a5568;
        }

        .legend {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .designation-badge {
            display: inline-block;
            padding: 2px 6px;
            margin-left: 5px;
            border-radius: 3px;
            font-size: 0.75rem;
            background: #805ad5;
            color: white;
            font-weight: bold;
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

            .program-selector {
                flex-direction: column;
            }

            .program-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Digital Technology Cluster Crosswalk Analysis</h1>
        <p class="subtitle">Maryland Educational Programs & Industry Credentials</p>

        <div class="program-selector">
            <button class="program-btn active" onclick="selectProgram('all')">All Programs</button>
            <button class="program-btn" onclick="selectProgram('programming')">Computer Programming I</button>
            <button class="program-btn" onclick="selectProgram('cybersecurity')">Cybersecurity</button>
            <button class="program-btn" onclick="selectProgram('ml')">Machine Learning & Data Science</button>
            <button class="program-btn" onclick="selectProgram('networking')">Networking</button>
        </div>

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
            <div class="stat-card">
                <div class="stat-number" id="nsaDesignated">0</div>
                <div class="stat-label">NSA/DHS Designated</div>
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

        <div class="legend">
            <div class="legend-item">
                <span class="program-type type-programming">PROG</span>
                <span>Programming</span>
            </div>
            <div class="legend-item">
                <span class="program-type type-cybersecurity">CYBER</span>
                <span>Cybersecurity</span>
            </div>
            <div class="legend-item">
                <span class="program-type type-ml">ML/DS</span>
                <span>Machine Learning</span>
            </div>
            <div class="legend-item">
                <span class="program-type type-networking">NET</span>
                <span>Networking</span>
            </div>
        </div>

        <div class="info-box">
            <h3>🎓 Key Industry Credentials by Program</h3>
            <ul>
                <li><strong>Programming:</strong> IT Specialist: Python, PCEP (Python Entry-Level)</li>
                <li><strong>Cybersecurity:</strong> CompTIA A+, Network+, Security+, CySA+</li>
                <li><strong>ML & Data Science:</strong> IBM Data Science, Google Data Analytics, Azure Data Scientist, CompTIA Data+, AWS-SA</li>
                <li><strong>Networking:</strong> CompTIA A+, Network+, Security+, Cisco RSTECH, CCNA</li>
            </ul>
        </div>

        <div class="table-container">
            <table id="dataTable">
                <thead>
                    <tr>
                        <th>Program Area</th>
                        <th>Institution</th>
                        <th>Type</th>
                        <th>Degrees/Programs</th>
                        <th>Certificates</th>
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
            // Computer Programming I - Community Colleges
            {
                programArea: "PROG",
                institution: "Montgomery College (MC)",
                type: "Community College",
                programs: "Computer Programming Certificate",
                certificates: "Python Programming (CMSC 206), Career Certificate",
                features: "Python fundamentals, variables, data types, control structures, functions, I/O operations",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Community College of Baltimore County (CCBC)",
                type: "Community College",
                programs: "Python Developer, Continuing Education",
                certificates: "Workforce Certificate",
                features: "Introductory through advanced Python including NumPy, pandas, matplotlib libraries",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Carroll Community College",
                type: "Community College",
                programs: "Computer Programming Certificate",
                certificates: "Career Certificate",
                features: "Python, C++, and Java with focus on problem solving and algorithm development",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Anne Arundel Community College (AACC)",
                type: "Community College",
                programs: "Computer Science, A.S.",
                certificates: "Python Programming courses (credit/noncredit)",
                features: "Python using fundamental design principles, data structures, security applications",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Prince George's Community College (PGCC)",
                type: "Community College",
                programs: "Computer Programming Certificate, Computer Science, A.S.",
                certificates: "Career Certificate",
                features: "Theoretical and practical background in Java, C++, and Python",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "College of Southern Maryland (CSM)",
                type: "Community College",
                programs: "Computer Science, A.S.",
                certificates: "",
                features: "Solid theoretical and mathematical foundation with programming and data structures",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Harford Community College",
                type: "Community College",
                programs: "Computer Science, A.S.; Programming, CIS Certificate",
                certificates: "Python Certificate",
                features: "PCEP™ Certified Entry-Level Python Programmer preparation",
                credentials: "IT Specialist: Python, PCEP",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Frederick Community College (FCC)",
                type: "Community College",
                programs: "Game Programming Certificate; Computer Studies",
                certificates: "Coding & Programming continuing education",
                features: "Python with game development applications",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Howard Community College (HCC)",
                type: "Community College",
                programs: "Computer Science, A.A. (Transfer)",
                certificates: "Programming continuing education",
                features: "Java, C++, Python, JavaScript with strong transfer preparation",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Garrett College",
                type: "Community College",
                programs: "Computer Science, A.S.",
                certificates: "",
                features: "Programming Logic and Computer Science Programming I & II",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "Baltimore City Community College (BCCC)",
                type: "Community College",
                programs: "Computer Information Systems; Computer Science transfer",
                certificates: "",
                features: "Practical programming experience with application development emphasis",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            // Computer Programming I - Universities
            {
                programArea: "PROG",
                institution: "University of Maryland, College Park (UMD)",
                type: "University",
                programs: "Computer Science, B.S.",
                certificates: "",
                features: "CMSC131/132 using Java, Python courses including GEOG 276 Python programming",
                credentials: "IT Specialist: Python",
                nsaDesignated: false
            },
            {
                programArea: "PROG",
                institution: "University of Maryland, Baltimore County (UMBC)",
                type: "University",
                programs: "Computer Science, B.S. (ABET-accredited)",
                certificates: "",
                features: "CMSC 201 uses Python, comprehensive foundation with multiple tracks",
                credentials: "IT Specialist: Python",
                nsaDesignated: true
            },
            {
                programArea: "PROG",
                institution: "Towson University",
                type: "University",
                programs: "Computer Science, B.S. (ABET-accredited); CS with Software Engineering track",
                certificates: "",
                features: "Advanced programming including Python (COSC 395), software development",
                credentials: "IT Specialist: Python",
                nsaDesignated: true
            },
            // Cybersecurity - Community Colleges
            {
                programArea: "CYBER",
                institution: "Montgomery College (MC)",
                type: "Community College",
                programs: "Cybersecurity, A.A.S.",
                certificates: "Network Security, Computer Forensics",
                features: "NSTISSI 4011/4013 standards, CompTIA A+, Network+, Security+, CCNA preparation",
                credentials: "CompTIA A+, Network+, Security+, CCNA",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "College of Southern Maryland (CSM)",
                type: "Community College",
                programs: "Cybersecurity, A.A.S.",
                certificates: "Cybersecurity Certificate",
                features: "CompTIA A+, Security+, Linux+, CCNA, CEH preparation with hands-on labs",
                credentials: "CompTIA A+, Security+, Linux+, CCNA, CEH",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Community College of Baltimore County (CCBC)",
                type: "Community College",
                programs: "Cybersecurity, A.A.S.",
                certificates: "Cybersecurity Certificate",
                features: "CompTIA-aligned coursework with network security and incident response",
                credentials: "CompTIA Security+",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Carroll Community College",
                type: "Community College",
                programs: "Cybersecurity, A.A.S.",
                certificates: "Cybersecurity Certificate",
                features: "State-of-the-art cybersecurity lab, network defense and security protocols",
                credentials: "CompTIA Network+, Security+",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Anne Arundel Community College (AACC)",
                type: "Community College",
                programs: "Cybersecurity, A.A.S.",
                certificates: "Network Security, Computer Forensics",
                features: "Network defense, digital forensics, security fundamentals",
                credentials: "CompTIA A+, Network+, Security+",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Prince George's Community College (PGCC)",
                type: "Community College",
                programs: "Information Security, A.A.S.",
                certificates: "Cybersecurity Certificate",
                features: "CompTIA Security+ preparation and network security fundamentals",
                credentials: "CompTIA Security+",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Harford Community College",
                type: "Community College",
                programs: "Cybersecurity, A.A.S.",
                certificates: "Cybersecurity Certificate",
                features: "Industry certification preparation with security fundamentals",
                credentials: "CompTIA certifications",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Hagerstown Community College",
                type: "Community College",
                programs: "Information Systems Technology, A.A.S.",
                certificates: "Web/Multimedia Development Certificate",
                features: "Network security basics and secure coding practices",
                credentials: "CompTIA fundamentals",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Howard Community College (HCC)",
                type: "Community College",
                programs: "Computer Science, A.A. with Cybersecurity pathway",
                certificates: "Security coursework",
                features: "Network security basics and security protocol implementation",
                credentials: "CompTIA Network+ fundamentals",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Frederick Community College (FCC)",
                type: "Community College",
                programs: "Information Technology, A.A.S.",
                certificates: "Cybersecurity Certificate",
                features: "Security fundamentals and network defense with certification prep",
                credentials: "CompTIA Security+",
                nsaDesignated: false
            },
            // Cybersecurity - Universities
            {
                programArea: "CYBER",
                institution: "University of Maryland, Baltimore County (UMBC)",
                type: "University",
                programs: "Computer Science with Cybersecurity Track, B.S.; Cybersecurity, M.S.",
                certificates: "",
                features: "NSA/DHS CAE-CD and CAE-R designated, CMSC 426, CMSC 441 coursework",
                credentials: "CompTIA Network+, Security+",
                nsaDesignated: true
            },
            {
                programArea: "CYBER",
                institution: "University of Maryland Global Campus (UMGC)",
                type: "University",
                programs: "Cybersecurity Management & Policy, B.S.; Cybersecurity Technology, B.S.; Cybersecurity, M.S.",
                certificates: "",
                features: "NSA CAE-CD designated, CompTIA pathway with CMIT courses",
                credentials: "CompTIA A+, Network+, Security+",
                nsaDesignated: true
            },
            {
                programArea: "CYBER",
                institution: "Towson University",
                type: "University",
                programs: "Computer Science with Cyber Operations Track, B.S.; Information Security Certificate",
                certificates: "Graduate Certificate",
                features: "NSA CAE-CO designated since 2013, ITEC 357 prepares for CompTIA certs",
                credentials: "CompTIA Network+, Security+",
                nsaDesignated: true
            },
            {
                programArea: "CYBER",
                institution: "Bowie State University (BSU)",
                type: "University",
                programs: "Computer Science with Cybersecurity Focus, B.S.; Cyber Operations Engineering, B.S.",
                certificates: "",
                features: "NSA CAE-CD designated since 2009, COSC 478/479 coursework",
                credentials: "CompTIA fundamentals",
                nsaDesignated: true
            },
            {
                programArea: "CYBER",
                institution: "Capitol Technology University",
                type: "University",
                programs: "Cybersecurity, B.S.; Cybersecurity, M.S.",
                certificates: "Computer and Cybersecurity Certificate",
                features: "NSA CAE-CD designated, first two courses prepare for Security+ exam",
                credentials: "CompTIA A+, Network+, Security+, CEH",
                nsaDesignated: true
            },
            {
                programArea: "CYBER",
                institution: "Morgan State University",
                type: "University",
                programs: "Cybersecurity Intelligence Management, B.S.; Advanced Computing with Cybersecurity, M.S.",
                certificates: "",
                features: "NSA CAE-CD certified through 2027, non-technical management focus",
                credentials: "CompTIA Security+ fundamentals",
                nsaDesignated: true
            },
            {
                programArea: "CYBER",
                institution: "University of Maryland, College Park (UMD)",
                type: "University",
                programs: "Cybersecurity, M.Eng.",
                certificates: "Graduate Certificate in Engineering in Cybersecurity",
                features: "Advanced engineering-focused security topics, ENPM courses",
                credentials: "Advanced CompTIA objectives",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Johns Hopkins University",
                type: "University",
                programs: "Security Informatics, M.S.",
                certificates: "Graduate Certificates in Cybersecurity",
                features: "Multiple concentrations including cryptography, forensics, ethical hacking",
                credentials: "CompTIA CySA+",
                nsaDesignated: false
            },
            {
                programArea: "CYBER",
                institution: "Salisbury University",
                type: "University",
                programs: "Computer Science with Security Track, B.S.",
                certificates: "",
                features: "COSC courses in network security and cryptography",
                credentials: "CompTIA Security+",
                nsaDesignated: false
            },
            // Machine Learning & Data Science - Community Colleges
            {
                programArea: "ML/DS",
                institution: "Montgomery College (MC)",
                type: "Community College",
                programs: "Data Science and Analytics, A.A.S.",
                certificates: "Data Science Certificate",
                features: "Python, R, statistical analysis, ML fundamentals, Tableau, IBM/Google cert prep",
                credentials: "IBM Data Science, Google Data Analytics",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Prince George's Community College (PGCC)",
                type: "Community College",
                programs: "Data Science and Analysis Certificate",
                certificates: "Data Science and Analysis Certificate",
                features: "Python, pandas, NumPy, machine learning fundamentals, visualization",
                credentials: "IBM Data Science Professional Certificate",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Community College of Baltimore County (CCBC)",
                type: "Community College",
                programs: "Data Analytics Certificate",
                certificates: "Business Intelligence Analyst Certificate",
                features: "SQL, Python, Tableau, Power BI, predictive analytics, CompTIA Data+ prep",
                credentials: "CompTIA Data+, Google Data Analytics",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Anne Arundel Community College (AACC)",
                type: "Community College",
                programs: "Computer Science, A.S. with data science electives",
                certificates: "Data Analytics courses (continuing ed)",
                features: "Python programming, database management, statistical analysis",
                credentials: "Foundational data science skills",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Howard Community College (HCC)",
                type: "Community College",
                programs: "Computer Science, A.A. with Data Science pathway",
                certificates: "Business Analytics Certificate",
                features: "Statistics, Python, database systems, machine learning basics",
                credentials: "IBM Data Science fundamentals",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Carroll Community College",
                type: "Community College",
                programs: "Computer Science, A.S. with data analytics",
                certificates: "",
                features: "Python and R programming, database management, basic analytics",
                credentials: "Foundational data science",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "College of Southern Maryland (CSM)",
                type: "Community College",
                programs: "Computer Science, A.S.",
                certificates: "",
                features: "Data structures, algorithms, programming, mathematics foundation",
                credentials: "Prerequisites for ML",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Frederick Community College (FCC)",
                type: "Community College",
                programs: "Computer Science, A.S.",
                certificates: "Data Analytics continuing education",
                features: "Python, SQL, data visualization basics",
                credentials: "Google Data Analytics",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Harford Community College",
                type: "Community College",
                programs: "Computer Information Systems",
                certificates: "Business Analytics Certificate",
                features: "Database management, reporting, basic predictive analytics",
                credentials: "CompTIA Data+ objectives",
                nsaDesignated: false
            },
            // Machine Learning & Data Science - Universities
            {
                programArea: "ML/DS",
                institution: "University of Maryland, College Park (UMD)",
                type: "University",
                programs: "Data Science, B.S.; Machine Learning Minor; Data Science, M.S.",
                certificates: "",
                features: "CMSC 320, STAT 430, Azure/AWS certification prep",
                credentials: "Microsoft Azure Data Scientist, AWS-SA",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "University of Maryland, Baltimore County (UMBC)",
                type: "University",
                programs: "Data Science, B.S.; Statistics with ML Track, B.S.; Data Science, M.P.S.",
                certificates: "",
                features: "ABET-accredited, DATA 601, ML, deep learning, big data analytics",
                credentials: "IBM Data Science, Microsoft Azure",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Johns Hopkins University",
                type: "University",
                programs: "Applied Math & Statistics with DS Focus, B.S.; Data Science, M.S.; Applied & Computational Math, M.S.E.",
                certificates: "",
                features: "Advanced ML, neural networks, NLP, computer vision",
                credentials: "Advanced ML/DS, AWS-SA",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Towson University",
                type: "University",
                programs: "Computer Science, B.S. with DS concentration; Applied IT, M.S. with DS track",
                certificates: "",
                features: "COSC 436 Data Mining, COSC 757 Machine Learning, big data tech",
                credentials: "CompTIA Data+, Azure certifications",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "University of Maryland Global Campus (UMGC)",
                type: "University",
                programs: "Data Analytics, B.S.; Data Analytics, M.S.; Biotechnology with Bioinformatics, M.S.",
                certificates: "",
                features: "Online programs, Python, R, ML, cloud analytics on AWS/Azure",
                credentials: "Google, IBM, Microsoft, AWS certifications",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Morgan State University",
                type: "University",
                programs: "Computer Science, B.S. with AI/ML concentration; Advanced Computing, M.S. with DS track",
                certificates: "",
                features: "COSC 473 ML, COSC 475 Data Mining, deep learning",
                credentials: "IBM, Microsoft certification objectives",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Bowie State University",
                type: "University",
                programs: "Computer Science, B.S. with DS electives; Applied Computational Math, M.S.",
                certificates: "",
                features: "Data mining, ML, statistical computing",
                credentials: "Foundational ML/DS competencies",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Salisbury University",
                type: "University",
                programs: "Data Science, B.S.; Mathematics with Statistics Track, B.S.; Applied Computer Science, M.S.",
                certificates: "",
                features: "COSC/DATA courses in ML, big data, visualization",
                credentials: "CompTIA Data+, cloud certifications",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Capitol Technology University",
                type: "University",
                programs: "Data Science, B.S.; Data Analytics, M.S.",
                certificates: "",
                features: "Applied data science, predictive analytics, business intelligence",
                credentials: "Industry certification preparation",
                nsaDesignated: false
            },
            {
                programArea: "ML/DS",
                institution: "Hood College",
                type: "University",
                programs: "Computer Science, B.S. with DS concentration; Information Technology, M.S.",
                certificates: "",
                features: "ML, data mining, analytics coursework",
                credentials: "Foundational ML/DS skills",
                nsaDesignated: false
            },
            // Networking - Community Colleges
            {
                programArea: "NET",
                institution: "Montgomery College (MC)",
                type: "Community College",
                programs: "Network and Wireless Technologies, A.A.S.",
                certificates: "Networking Certificate, Cisco Networking Academy",
                features: "CCNA prep, CompTIA Network+/A+, routing/switching, network security",
                credentials: "CompTIA A+, Network+, Cisco CCNA",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Community College of Baltimore County (CCBC)",
                type: "Community College",
                programs: "Network Technology, A.A.S.",
                certificates: "Computer Networking Certificate, Cisco Academy",
                features: "Network admin, security, virtualization, cloud tech, CompTIA/Cisco prep",
                credentials: "CompTIA A+, Network+, Security+, Cisco certs",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Anne Arundel Community College (AACC)",
                type: "Community College",
                programs: "Networking, A.A.S.",
                certificates: "Network Administration Certificate, Cisco Academy",
                features: "Network fundamentals, routing protocols, switching, security, wireless",
                credentials: "CompTIA A+, Network+, Cisco objectives",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Prince George's Community College (PGCC)",
                type: "Community College",
                programs: "Information Technology with Networking, A.A.S.",
                certificates: "Network Administration Certificate",
                features: "Hardware/software support, TCP/IP, network security, virtualization",
                credentials: "CompTIA A+, Network+",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Carroll Community College",
                type: "Community College",
                programs: "Information Technology, A.A.S. with networking track",
                certificates: "Network Administration Certificate",
                features: "Network installation, configuration, management, troubleshooting",
                credentials: "CompTIA A+, Network+",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Howard Community College (HCC)",
                type: "Community College",
                programs: "Network Technology, A.A.S.",
                certificates: "Cisco Networking Academy, Network Security Certificate",
                features: "Routing, switching, network design, security",
                credentials: "CompTIA, Cisco certifications",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "College of Southern Maryland (CSM)",
                type: "Community College",
                programs: "Information Systems Technology, A.A.S. with networking",
                certificates: "Network Administration Certificate",
                features: "Network architecture, administration, security, cloud computing",
                credentials: "CompTIA A+, Network+",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Harford Community College",
                type: "Community College",
                programs: "Computer Information Systems with Networking, A.A.S.",
                certificates: "Network Technology Certificate",
                features: "Hardware, OS, network administration, security",
                credentials: "CompTIA certifications",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Frederick Community College (FCC)",
                type: "Community College",
                programs: "Information Technology, A.A.S.",
                certificates: "Network Administration Certificate, Cisco Academy",
                features: "Networking with virtualization, cloud computing, security",
                credentials: "CompTIA, Cisco certifications",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Hagerstown Community College",
                type: "Community College",
                programs: "Information Systems Technology, A.A.S.",
                certificates: "Network Administration pathway",
                features: "Network design, implementation, security, troubleshooting",
                credentials: "CompTIA A+, Network+",
                nsaDesignated: false
            },
            // Networking - Universities
            {
                programArea: "NET",
                institution: "University of Maryland Global Campus (UMGC)",
                type: "University",
                programs: "Computer Networks and Cybersecurity, B.S.",
                certificates: "Network Security Certificate",
                features: "Network design, admin, security, cloud, virtualization, CompTIA/Cisco prep",
                credentials: "CompTIA A+, Network+, Security+, Cisco CCNA",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Towson University",
                type: "University",
                programs: "Information Technology, B.S. with Networking Technologies track",
                certificates: "Network Administration Certificate",
                features: "ITEC courses in network fundamentals, routing/switching, security, wireless",
                credentials: "CompTIA Network+, Security+",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "University of Maryland, Baltimore County (UMBC)",
                type: "University",
                programs: "Information Systems, B.S. with networking; Computer Science, B.S. with systems",
                certificates: "",
                features: "IS 450/451 Network Design/Admin, comprehensive security",
                credentials: "CompTIA Network+, advanced networking",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Capitol Technology University",
                type: "University",
                programs: "Network Security, B.S.; Computer Engineering Technology, B.S.",
                certificates: "",
                features: "NSA-designated, hands-on labs, virtualization, cloud networking",
                credentials: "CompTIA Network+, Security+, Cisco",
                nsaDesignated: true
            },
            {
                programArea: "NET",
                institution: "Bowie State University",
                type: "University",
                programs: "Computer Technology, B.S. with Network Security track",
                certificates: "",
                features: "CTEC courses in network admin, security, wireless, cloud",
                credentials: "CompTIA A+, Network+",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Morgan State University",
                type: "University",
                programs: "Information Systems, B.S.; Electrical & Computer Engineering, B.S.",
                certificates: "",
                features: "Network design, administration, security fundamentals",
                credentials: "CompTIA Network+",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Salisbury University",
                type: "University",
                programs: "Information Systems, B.S. with networking electives",
                certificates: "",
                features: "Network architecture, administration, security, emerging tech",
                credentials: "CompTIA certifications",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Frostburg State University",
                type: "University",
                programs: "Information Technology, B.S. with networking concentration",
                certificates: "",
                features: "Network design, implementation, security, management",
                credentials: "CompTIA A+, Network+",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "University of Maryland, College Park (UMD)",
                type: "University",
                programs: "Computer Engineering, B.S.; Electrical Engineering, B.S.",
                certificates: "",
                features: "Advanced network protocols, wireless communications, network security",
                credentials: "Advanced networking, Cisco certifications",
                nsaDesignated: false
            },
            {
                programArea: "NET",
                institution: "Johns Hopkins University",
                type: "University",
                programs: "Computer Science, B.S. with networking",
                certificates: "Information Security Institute programs",
                features: "Advanced networking, distributed systems, network security",
                credentials: "CompTIA Security+, advanced networking",
                nsaDesignated: false
            }
        ];

        let currentFilter = 'all';

        function populateTable(filter = 'all') {
            const tableBody = document.getElementById('tableBody');
            tableBody.innerHTML = '';
            
            let filteredData = programData;
            
            if (filter === 'programming') {
                filteredData = programData.filter(row => row.programArea === 'PROG');
            } else if (filter === 'cybersecurity') {
                filteredData = programData.filter(row => row.programArea === 'CYBER');
            } else if (filter === 'ml') {
                filteredData = programData.filter(row => row.programArea === 'ML/DS');
            } else if (filter === 'networking') {
                filteredData = programData.filter(row => row.programArea === 'NET');
            }
            
            filteredData.forEach(row => {
                const tr = document.createElement('tr');
                const typeClass = row.type === 'Community College' ? 'type-community' : 'type-university';
                const programClass = row.programArea === 'PROG' ? 'type-programming' :
                                    row.programArea === 'CYBER' ? 'type-cybersecurity' :
                                    row.programArea === 'ML/DS' ? 'type-ml' : 'type-networking';
                
                const nsaBadge = row.nsaDesignated ? '<span class="designation-badge">NSA/DHS</span>' : '';
                
                tr.innerHTML = `
                    <td><span class="program-type ${programClass}">${row.programArea}</span></td>
                    <td><strong>${row.institution}</strong>${nsaBadge}</td>
                    <td><span class="institution-type ${typeClass}">${row.type}</span></td>
                    <td>${row.programs}</td>
                    <td>${row.certificates ? row.certificates.split(',').map(c => `<span class="certificate-tag">${c.trim()}</span>`).join('') : '-'}</td>
                    <td>${row.features}</td>
                    <td>${row.credentials ? row.credentials.split(',').map(c => `<span class="credential-badge">${c.trim()}</span>`).join('') : '-'}</td>
                `;
                tableBody.appendChild(tr);
            });
            
            updateStats(filteredData);
        }

        function updateStats(data = programData) {
            document.getElementById('totalPrograms').textContent = data.length;
            document.getElementById('communityColleges').textContent = data.filter(p => p.type === 'Community College').length;
            document.getElementById('universities').textContent = data.filter(p => p.type === 'University').length;
            document.getElementById('certificatePrograms').textContent = data.filter(p => p.certificates !== '').length;
            document.getElementById('nsaDesignated').textContent = data.filter(p => p.nsaDesignated === true).length;
        }

        function selectProgram(program) {
            currentFilter = program;
            
            // Update button states
            document.querySelectorAll('.program-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');
            
            populateTable(program);
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
            let csvContent = "Program Area,Institution,Type,Programs/Degrees,Certificates,Key Features,Industry Credentials,NSA Designated\n";
            
            programData.forEach(row => {
                csvContent += `"${row.programArea}","${row.institution}","${row.type}","${row.programs}","${row.certificates || '-'}","${row.features}","${row.credentials || '-'}","${row.nsaDesignated ? 'Yes' : 'No'}"\n`;
            });
            
            const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            const url = URL.createObjectURL(blob);
            link.setAttribute('href', url);
            link.setAttribute('download', 'Digital_Technology_Cluster_Crosswalk.csv');
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