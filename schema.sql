
-- PLATFORMS table (master reference)
CREATE TABLE IF NOT EXISTS platforms (
  platform_id     VARCHAR(10)  PRIMARY KEY,
  platform_name   VARCHAR(100) NOT NULL,
  platform_type   VARCHAR(20)  CHECK (platform_type IN ('SVOD','AVOD','AVOD/SVOD')),
  hq_country      VARCHAR(50),
  launch_year     INTEGER,
  parent_company  VARCHAR(100),
  has_avod_tier   BOOLEAN,
  created_at      TIMESTAMP DEFAULT NOW()
);

-- SUBSCRIBERS table (fact table)
CREATE TABLE IF NOT EXISTS subscribers (
  subscriber_id   SERIAL PRIMARY KEY,
  platform_id     VARCHAR(10) REFERENCES platforms(platform_id),
  region          VARCHAR(20) CHECK (region IN ('Europe','APAC','MEA','Americas')),
  year            INTEGER,
  quarter         INTEGER CHECK (quarter BETWEEN 1 AND 4),
  subscribers_m   DECIMAL(6,2),
  source          VARCHAR(50),
  loaded_at       TIMESTAMP DEFAULT NOW()
);

-- PRICING table
CREATE TABLE IF NOT EXISTS pricing (
  pricing_id      SERIAL PRIMARY KEY,
  platform_id     VARCHAR(10) REFERENCES platforms(platform_id),
  country         VARCHAR(50),
  region          VARCHAR(20),
  price_usd       DECIMAL(8,2),
  price_eur       DECIMAL(8,2),
  tier            VARCHAR(30),
  updated_date    DATE
);

-- MARKET_INDICATORS table (World Bank data)
CREATE TABLE IF NOT EXISTS market_indicators (
  indicator_id       SERIAL PRIMARY KEY,
  country_code       CHAR(3),
  country_name       VARCHAR(100),
  region             VARCHAR(20),
  year               INTEGER,
  internet_pct       DECIMAL(5,2),
  population_m       DECIMAL(8,2)
);

-- SYNTHETIC_DATA table (monthly granularity)
CREATE TABLE IF NOT EXISTS synthetic_monthly (
  row_id          SERIAL PRIMARY KEY,
  platform_id     VARCHAR(10) REFERENCES platforms(platform_id),
  region          VARCHAR(20),
  year            INTEGER,
  month           INTEGER CHECK (month BETWEEN 1 AND 12),
  subscribers_m   DECIMAL(6,2),
  price_eur       DECIMAL(8,2),
  churn_rate_pct  DECIMAL(5,3),
  arpu_eur        DECIMAL(8,4)
);
