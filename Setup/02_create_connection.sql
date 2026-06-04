-- ============================================
-- Step 2: Create BigQuery Connection to Vertex AI
-- ============================================
-- This allows BigQuery to call Gemini models

CREATE CONNECTION  if not exists `ai-doc-processor-kabilan.us.vertex-ai-conn`
  OPTIONS (connection_type = "CLOUD_RESOURCE");


-- Verify connection
SELECT * FROM `ai-doc-processor-kabilan.us.INFORMATION_SCHEMA.CONNECTIONS`
WHERE connection_name LIKE '%vertex%';
