# CTE Cluster Crosswalk Interactive Tables

## Repository
https://github.com/w4ester/crosswalking_cte_you_and_thee

## Overview
Interactive web tables for Maryland Career and Technical Education (CTE) cluster crosswalks, showing the alignment between educational programs, industry credentials, and career pathways.

## Contents

### HTML Files (Original)
- `index.html` - Main landing page with cluster selection
- `003_ed_crosswalk-table.html` - Education & Training cluster crosswalk
- `003_table_enr_renewable_energy_crosswalk_table.html` - ENR renewable energy programs
- `dt-crosswalk-table.html` - Design & Technology cluster crosswalk
- `enr-crosswalk-static.html` - ENR static data table (no CSV dependency)
- `enr-crosswalk-table.html` - ENR dynamic crosswalk table
- `pss_crosswalk_html.html` - Public Safety & Services cluster crosswalk

### ASPX Files (SharePoint Compatible)
All HTML files have corresponding `.aspx` versions for SharePoint Online compatibility, which allows JavaScript execution in SharePoint's strict security environment.

### Data Files
- `Education_Cluster_Crosswalk.csv` - Source data for Education & Training cluster

## Features
- Interactive search and filtering
- Export to Excel/CSV functionality
- Responsive design for mobile and desktop
- Institution type categorization (Community Colleges vs Universities)
- Industry credential alignment tracking
- Certificate program highlighting

## Usage

### Local Development
Simply open any HTML file in a web browser to view the interactive tables.

### SharePoint Deployment
Use the `.aspx` versions when deploying to SharePoint Online to ensure JavaScript functionality works properly.

### GitHub Pages
This repository can be hosted directly using GitHub Pages. The HTML files will work seamlessly when served as static content.

## Technical Details
- Pure JavaScript implementation (no external dependencies)
- Self-contained data (embedded in JavaScript or CSV files)
- Responsive CSS with modern styling
- Cross-browser compatible

## License
Educational use - Maryland State Department of Education

## Copyright
© 2025 Maryland State Department of Education. All rights reserved.