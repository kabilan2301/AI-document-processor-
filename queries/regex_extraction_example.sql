-- ============================================
-- Regex Extraction Example
-- ============================================
-- This demonstrates how regex is used to extract
-- sentiment and category from Gemini's output

SELECT 
  review,
  gemini_raw_output,
  -- Extract sentiment
  CASE 
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"sentiment":\s*"Positive"') THEN 'Positive'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"sentiment":\s*"Negative"') THEN 'Negative'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"sentiment":\s*"Neutral"') THEN 'Neutral'
    ELSE 'Unknown'
  END AS extracted_sentiment,
  -- Extract category
  CASE 
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Acting"') THEN 'Acting'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Plot"') THEN 'Plot'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Visuals"') THEN 'Visuals'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Sound"') THEN 'Sound'
    ELSE 'Other'
  END AS extracted_category
FROM `ai-doc-processor-kabilan.document_ai_us.temp_gemini_output`
LIMIT 5;
