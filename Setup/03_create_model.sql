-- ============================================
-- Step 3: Create Gemini Model in BigQuery
-- ============================================
-- Using Gemini 2.5 Flash Lite - most cost-effective for this use case

CREATE OR REPLACE MODEL `ai-doc-processor-kabilan.document_ai_us.gemini_flash`
REMOTE WITH CONNECTION `ai-doc-processor-kabilan.us.vertex-ai-conn`
OPTIONS (
  endpoint = 'gemini-2.5-flash-lite',
  description = 'Gemini 2.5 Flash Lite for sentiment analysis'
);

-- Verify model creation
SELECT 
  model_name,
  model_type,
  created AS creation_time
FROM `ai-doc-processor-kabilan.document_ai_us.INFORMATION_SCHEMA.MODELS`
WHERE model_name = 'gemini_flash';
