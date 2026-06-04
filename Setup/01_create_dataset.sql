### setup/01_create_dataset.sql

-- ============================================
-- Step 1: Create Dataset in US Region
-- ============================================
-- The IMDB public dataset is in US multi-region
-- Your dataset MUST be in the same region

CREATE SCHEMA IF NOT EXISTS `ai-doc-processor-kabilan.document_ai_us`
OPTIONS (
  location = 'US',
  description = 'Dataset for IMDB review sentiment analysis with Gemini'
);

-- Verify dataset creation
SELECT * FROM `ai-doc-processor-kabilan.document_ai_us.__TABLES__`;
