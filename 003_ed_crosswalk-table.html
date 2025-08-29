<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Education Cluster Crosswalk Analysis</title>
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
            max-width: 1600px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        h1 {
            color: #231F20;
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-align: center;
            background: linear-gradient(135deg, #BD0934, #FFC838);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .subtitle {
            text-align: center;
            color: #231F20;
            margin-bottom: 30px;
            font-size: 1.1rem;
        }

        .program-selector {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .program-btn {
            padding: 15px 30px;
            border: 2px solid #BD0934;
            background: white;
            color: #BD0934;
            border-radius: 50px;
            font-size: 1.1rem;
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
            background: linear-gradient(135deg, #BD0934, #FFC838);
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
            box-shadow: 0 10px 20px rgba(189, 9, 52, 0.3);
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
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            background: linear-gradient(135deg, #BD0934, #FFC838);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .stat-label {
            color: #231F20;
            margin-top: 5px;
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
            border-color: #BD0934;
            box-shadow: 0 0 0 3px rgba(189, 9, 52, 0.1);
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
            background: linear-gradient(135deg, #BD0934, #FFC838);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(189, 9, 52, 0.3);
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

        .btn-tertiary {
            background: #ed8936;
            color: white;
        }

        .btn-tertiary:hover {
            background: #dd6b20;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(237, 137, 54, 0.3);
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
            background: linear-gradient(135deg, #BD0934, #FFC838);
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
            background: #E2E3E4;
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

        .type-private {
            background: #fed7e4;
            color: #702459;
        }

        .program-type {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-right: 5px;
        }

        .type-ece {
            background: #faf5ff;
            color: #553c9a;
        }

        .type-tam {
            background: #fef5e7;
            color: #7c2d12;
        }

        .credential-badge {
            display: inline-block;
            padding: 3px 8px;
            margin: 2px;
            border-radius: 5px;
            font-size: 0.85rem;
            background: #f0f4f8;
            color: #231F20;
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
            border-left: 4px solid #BD0934;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }

        .info-box h3 {
            color: #231F20;
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
        <h1>Education Cluster Crosswalk Analysis</h1>
        <p class="subtitle">Maryland Educational Programs & Industry Credentials</p>

        <div class="program-selector">
            <button class="program-btn active" onclick="selectProgram('all')">All Programs</button>
            <button class="program-btn" onclick="selectProgram('ece')">Early Childhood Education</button>
            <button class="program-btn" onclick="selectProgram('tam')">Teacher Academy of Maryland</button>
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
                <button class="btn-tertiary" onclick="filterTable('private')">Private Institutions</button>
                <button class="btn-primary" onclick="exportToExcel()">📊 Export to Excel</button>
            </div>
        </div>

        <div class="legend">
            <div class="legend-item">
                <span class="program-type type-ece">ECE</span>
                <span>Early Childhood Education</span>
            </div>
            <div class="legend-item">
                <span class="program-type type-tam">TAM</span>
                <span>Teacher Academy of Maryland</span>
            </div>
        </div>

        <div class="info-box">
            <h3>📚 Key Industry Credentials</h3>
            <ul>
                <li><strong>ECE Programs:</strong> Child Development Associate (CDA), Maryland Child Care Credential (90-hour/45-hour), ParaPro Assessment</li>
                <li><strong>TAM Programs:</strong> ParaPro Assessment, Praxis Core Academic Skills, Praxis II Subject Assessments</li>
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
            // Early Childhood Education - Community Colleges
            {
                programArea: "ECE",
                institution: "Anne Arundel CC (AACC)",
                type: "Community College",
                programs: "Early Childhood Education/Early Childhood Special Education AAS; Teacher Education & Child Care AAT",
                certificates: "Early Childhood Education Certificate, School-Age Child Care Certificate",
                features: "CDA Competency Standards alignment, 120 clock hours training, field experience",
                credentials: "CDA, Maryland Child Care Credential Level 4, ParaPro Assessment"
            },
            {
                programArea: "ECE",
                institution: "Montgomery College (MC)",
                type: "Community College",
                programs: "Early Childhood Education AAS; Child Development AA",
                certificates: "CDA Preparation Certificate, Infant and Toddler Care Certificate, Early Childhood Education Certificate",
                features: "CDA Preparation with 120 clock hours, specialized endorsements",
                credentials: "CDA, Maryland Child Care Credential Level 4"
            },
            {
                programArea: "ECE",
                institution: "Prince George's CC (PGCC)",
                type: "Community College",
                programs: "Early Childhood Education/Early Childhood Special Education AAS",
                certificates: "Child Development Certificate, Infant/Toddler Certificate, School-Age Child Care Certificate",
                features: "CDA alignment, MSDE Office of Child Care regulations (COMAR 13A.16.06)",
                credentials: "CDA, Maryland Child Care Credential Level 4"
            },
            {
                programArea: "ECE",
                institution: "Community College of Baltimore County (CCBC)",
                type: "Community College",
                programs: "Early Childhood Education AAS; Teacher Education-Early Childhood AAT",
                certificates: "Child Care Certificate, Early Childhood Special Education Certificate",
                features: "CDA preparation, teacher certification pathway",
                credentials: "CDA, Maryland Child Care Credential Level 4, ParaPro Assessment"
            },
            {
                programArea: "ECE",
                institution: "Howard CC (HCC)",
                type: "Community College",
                programs: "Early Childhood Development AAS; Teacher Education-Early Childhood AAT",
                certificates: "Child Development Associate Certificate",
                features: "CDA preparation, teacher education transfer pathway",
                credentials: "CDA, Maryland Child Care Credential Level 4, ParaPro Assessment"
            },
            {
                programArea: "ECE",
                institution: "Carroll CC",
                type: "Community College",
                programs: "Early Childhood Education AAS",
                certificates: "Early Childhood Certificate, Infant/Toddler Care Certificate",
                features: "CDA alignment, specialized infant/toddler focus",
                credentials: "CDA, Maryland Child Care Credential"
            },
            {
                programArea: "ECE",
                institution: "Harford CC",
                type: "Community College",
                programs: "Early Childhood Development AAS",
                certificates: "Child Care Professional Certificate, Early Childhood Administration Certificate",
                features: "Administration focus, CDA alignment",
                credentials: "CDA, Maryland Child Care Credential"
            },
            {
                programArea: "ECE",
                institution: "Frederick CC (FCC)",
                type: "Community College",
                programs: "Early Childhood Education AAS",
                certificates: "Early Childhood Education Certificate, School-Age Child Care Certificate",
                features: "School-age specialization, CDA alignment",
                credentials: "CDA, Maryland Child Care Credential"
            },
            {
                programArea: "ECE",
                institution: "College of Southern Maryland (CSM)",
                type: "Community College",
                programs: "Early Childhood Education AAS",
                certificates: "Early Childhood Education Certificate, Infant/Toddler Certificate",
                features: "CDA alignment, infant/toddler specialization",
                credentials: "CDA, Maryland Child Care Credential"
            },
            {
                programArea: "ECE",
                institution: "Wor-Wic CC",
                type: "Community College",
                programs: "Early Childhood Education AAS",
                certificates: "Early Childhood Development Certificate",
                features: "CDA alignment, field experience",
                credentials: "CDA, Maryland Child Care Credential"
            },
            {
                programArea: "ECE",
                institution: "Chesapeake College",
                type: "Community College",
                programs: "Early Childhood Development AAS",
                certificates: "Child Development Certificate",
                features: "CDA alignment, practicum placements",
                credentials: "CDA, Maryland Child Care Credential"
            },
            // Early Childhood Education - Universities
            {
                programArea: "ECE",
                institution: "Towson University",
                type: "University",
                programs: "Early Childhood Education BS (Birth-Grade 3); Child Life/Family Collaboration BS",
                certificates: "",
                features: "Maryland teaching certification PreK-3, student teaching",
                credentials: "Praxis II: Education of Young Children (5024), Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "University of Maryland, College Park",
                type: "University",
                programs: "Early Childhood/Early Childhood Special Education BS; Human Development BS (Child Development track)",
                certificates: "",
                features: "Dual certification options, special education focus",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "Salisbury University",
                type: "University",
                programs: "Early Childhood Education BS (PreK-3); Early Childhood/Elementary Education Dual BS",
                certificates: "",
                features: "Dual certification pathway, extensive field experience",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "Coppin State University",
                type: "University",
                programs: "Early Childhood Education BS; Applied Psychology BS (Child & Adolescent Development)",
                certificates: "",
                features: "Psychology integration, urban education focus",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "Bowie State University",
                type: "University",
                programs: "Early Childhood Education BS; Child & Adolescent Studies BA",
                certificates: "",
                features: "Child development focus, teaching certification",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "Frostburg State University",
                type: "University",
                programs: "Early Childhood/Elementary Education BS (dual certification P-6)",
                certificates: "",
                features: "Dual certification P-6, rural education emphasis",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "University of Maryland Eastern Shore (UMES)",
                type: "University",
                programs: "Child Development BS; Human Ecology BS (Child & Family Sciences)",
                certificates: "",
                features: "Family sciences integration, human ecology approach",
                credentials: "Child Development credentials"
            },
            {
                programArea: "ECE",
                institution: "Morgan State University",
                type: "University",
                programs: "Elementary Education BS with Early Childhood concentration",
                certificates: "",
                features: "Early childhood concentration within elementary program",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "Hood College",
                type: "Private",
                programs: "Early Childhood Education BA/BS; Human Development & Family Studies BS",
                certificates: "",
                features: "Family studies integration, small class sizes",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "McDaniel College",
                type: "Private",
                programs: "Human Services BA (Child & Family Studies track); Education BS (Early Childhood specialization)",
                certificates: "",
                features: "Human services approach, early childhood specialization",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "ECE",
                institution: "Notre Dame of Maryland University",
                type: "Private",
                programs: "Early Childhood Education BS",
                certificates: "",
                features: "Women's college tradition, urban education focus",
                credentials: "Praxis II, Maryland Teacher Certification"
            },
            // Teacher Academy of Maryland - Community Colleges
            {
                programArea: "TAM",
                institution: "Anne Arundel CC (AACC)",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary/Special Education tracks)",
                certificates: "Education Paraprofessional Certificate",
                features: "Multiple certification tracks, seamless transfer design",
                credentials: "ParaPro Assessment, Praxis Core preparation"
            },
            {
                programArea: "TAM",
                institution: "Montgomery College (MC)",
                type: "Community College",
                programs: "Teaching AAT (Elementary/Secondary/Special Education tracks)",
                certificates: "Education Paraprofessional Certificate, Teaching Assistant Certificate",
                features: "ParaPro preparation, multiple pathways",
                credentials: "ParaPro Assessment (459 passing score), Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Prince George's CC (PGCC)",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary/Special Education)",
                certificates: "Education Foundation Certificate, Paraeducator Certificate",
                features: "Foundation coursework, paraeducator preparation",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Community College of Baltimore County (CCBC)",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary/Special Education tracks)",
                certificates: "Education Paraprofessional Certificate",
                features: "Urban education focus, transfer guarantee",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Howard CC (HCC)",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary/Special Education)",
                certificates: "Teaching Assistant Certificate",
                features: "Teaching assistant preparation, field experience",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Frederick CC (FCC)",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary)",
                certificates: "Paraeducator Certificate, Education Support Professional Certificate",
                features: "Dual certificate options, support professional training",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Carroll CC",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary Education)",
                certificates: "Education Paraprofessional Certificate",
                features: "Rural education emphasis, transfer pathways",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Harford CC",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary/Special Education)",
                certificates: "Instructional Assistant Certificate",
                features: "Instructional assistant focus, special education track",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "College of Southern Maryland (CSM)",
                type: "Community College",
                programs: "Teacher Education AAT",
                certificates: "Educational Support Certificate",
                features: "Educational support preparation, transfer design",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Chesapeake College",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary)",
                certificates: "Education Support Certificate",
                features: "Eastern Shore focus, support roles preparation",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Wor-Wic CC",
                type: "Community College",
                programs: "Teacher Education AAT",
                certificates: "Paraeducator Certificate",
                features: "Paraeducator preparation, transfer pathway",
                credentials: "ParaPro Assessment, Praxis Core"
            },
            {
                programArea: "TAM",
                institution: "Allegany College of Maryland",
                type: "Community College",
                programs: "Teacher Education AAT (Elementary/Secondary)",
                certificates: "",
                features: "Western Maryland focus, transfer design",
                credentials: "Praxis Core preparation"
            },
            {
                programArea: "TAM",
                institution: "Garrett College",
                type: "Community College",
                programs: "Teacher Education AAT",
                certificates: "",
                features: "Rural education emphasis, small class sizes",
                credentials: "Praxis Core preparation"
            },
            // Teacher Academy of Maryland - Universities
            {
                programArea: "TAM",
                institution: "Towson University",
                type: "University",
                programs: "Elementary Education BS, Middle School Education BS, Secondary Education BS (15+ content areas), Special Education BS, Art Education BFA",
                certificates: "",
                features: "15+ secondary content areas, comprehensive teacher preparation",
                credentials: "Praxis Core, Praxis II Subject Assessments, edTPA, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "University of Maryland, College Park",
                type: "University",
                programs: "Elementary Education BS, Secondary Education BS, Special Education BS, Music Education BM",
                certificates: "",
                features: "Research-based pedagogy, extensive field placements",
                credentials: "Praxis Core (R:156, W:162, M:150), Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Salisbury University",
                type: "University",
                programs: "Elementary Education BS, Secondary Education BS, Physical Education BS, STEM Education BS",
                certificates: "",
                features: "STEM education specialty, physical education option",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Frostburg State University",
                type: "University",
                programs: "Elementary Education BS, Secondary Education BS, Physical Education BS, Recreation & Parks Management BS (teaching option)",
                certificates: "",
                features: "Recreation teaching option, mountain region focus",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Coppin State University",
                type: "University",
                programs: "Elementary Education BS, Secondary Education BS (Math, English, History/Social Studies, Biology), Special Education BS",
                certificates: "",
                features: "Urban education emphasis, HBCU tradition",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Bowie State University",
                type: "University",
                programs: "Elementary Education BS, Secondary Education BS, Special Education BS",
                certificates: "",
                features: "HBCU tradition, diverse certification options",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "University of Maryland, Baltimore County (UMBC)",
                type: "University",
                programs: "Education Studies BA (MAT prep), Physics BS (Secondary Ed track), Mathematics BS (Secondary Ed track)",
                certificates: "",
                features: "STEM education focus, MAT preparation pathway",
                credentials: "Praxis Core, Praxis II (content specific)"
            },
            {
                programArea: "TAM",
                institution: "University of Maryland Eastern Shore (UMES)",
                type: "University",
                programs: "Mathematics BS (Teacher Ed track), English BA (Teacher Ed track), Agriculture Education BS",
                certificates: "",
                features: "Agriculture education unique offering, content-specific tracks",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Morgan State University",
                type: "University",
                programs: "Elementary Education BS, Secondary Education BS (Bio, Chem, English, History, Math), Music Education BM",
                certificates: "",
                features: "Music education, comprehensive secondary options",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "St. Mary's College of Maryland",
                type: "University",
                programs: "Educational Studies BA (teacher certification track)",
                certificates: "",
                features: "Liberal arts approach, honors college tradition",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Hood College",
                type: "Private",
                programs: "Elementary Education BA/BS, Secondary Education BA/BS, Special Education BA/BS",
                certificates: "",
                features: "Small class sizes, personalized instruction",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "McDaniel College",
                type: "Private",
                programs: "Elementary Education BS, Secondary Education BS",
                certificates: "",
                features: "Liberal arts foundation, field experience emphasis",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Notre Dame of Maryland University",
                type: "Private",
                programs: "Elementary Education BS, Secondary Education BS",
                certificates: "",
                features: "Women's college tradition, urban placement opportunities",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Loyola University Maryland",
                type: "Private",
                programs: "Elementary Education BS, Secondary Education BS",
                certificates: "",
                features: "Jesuit tradition, service learning integration",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            },
            {
                programArea: "TAM",
                institution: "Washington College",
                type: "Private",
                programs: "Secondary Education Certification (with content major)",
                certificates: "",
                features: "Content major emphasis, liberal arts foundation",
                credentials: "Praxis Core, Praxis II, Maryland Teacher Certification"
            }
        ];

        let currentFilter = 'all';

        function populateTable(filter = 'all') {
            const tableBody = document.getElementById('tableBody');
            tableBody.innerHTML = '';
            
            let filteredData = programData;
            
            if (filter === 'ece') {
                filteredData = programData.filter(row => row.programArea === 'ECE');
            } else if (filter === 'tam') {
                filteredData = programData.filter(row => row.programArea === 'TAM');
            }
            
            filteredData.forEach(row => {
                const tr = document.createElement('tr');
                const typeClass = row.type === 'Community College' ? 'type-community' : 
                                  row.type === 'Private' ? 'type-private' : 'type-university';
                const programClass = row.programArea === 'ECE' ? 'type-ece' : 'type-tam';
                
                tr.innerHTML = `
                    <td><span class="program-type ${programClass}">${row.programArea}</span></td>
                    <td><strong>${row.institution}</strong></td>
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
                } else if (type === 'private') {
                    row.style.display = row.innerHTML.includes('type-private') ? '' : 'none';
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
            let csvContent = "Program Area,Institution,Type,Programs/Degrees,Certificates,Key Features,Industry Credentials\n";
            
            programData.forEach(row => {
                csvContent += `"${row.programArea}","${row.institution}","${row.type}","${row.programs}","${row.certificates || '-'}","${row.features}","${row.credentials || '-'}"\n`;
            });
            
            const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            const url = URL.createObjectURL(blob);
            link.setAttribute('href', url);
            link.setAttribute('download', 'Education_Cluster_Crosswalk.csv');
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