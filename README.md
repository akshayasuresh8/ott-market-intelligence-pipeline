# OTT Market Intelligence Pipeline


## Project Overview
Automated end-to-end market analytics pipeline tracking OTT subscriber
growth, pricing trends, and competitive dynamics across Europe, APAC,
and MEA markets. Built to simulate real workflows at media intelligence firms.


## Tools Used
| Tool | Role |
|------|------|
| Excel | Data staging, cleaning, validation |
| PostgreSQL | Data warehouse, SQL analytics |
| n8n | Automated ETL pipeline |
| Quadratic | Python statistical analysis |
| Power BI | Executive dashboard |


## Architecture
Excel (raw data) → n8n (ETL) → PostgreSQL (storage) → Quadratic (analysis) → Power BI (dashboard)


## Key Findings
- Netflix holds 45%+ market share in Europe across all years analyzed
- APAC subscription prices are 30-40% lower than EU equivalents
- Negative correlation between price and subscriber growth (R² = 0.XX)
- MEA shows highest YoY growth rate despite lowest absolute subscribers


## Data Sources
- Netflix, Disney+, Amazon investor relations reports (public)
- World Bank internet penetration indicator (IT.NET.USER.ZS)
- Eurostat digital economy survey (isoc_bde15b)
- Synthetic monthly data modelled on published benchmarks (documented)


## How to Run Locally
1. Install PostgreSQL, n8n, Quadratic (see Pre-Setup section)
2. Run schema.sql in pgAdmin to create tables
3. Import n8n workflow JSON and execute to load data
4. Open Quadratic and connect to ott_market_db
5. Open Power BI and connect to PostgreSQL or import CSV exports

