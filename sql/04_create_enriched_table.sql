-- ============================================
-- Step 4: Create Final Enriched Table
-- ============================================
-- Extract sentiment and category using regex from raw output

CREATE OR REPLACE TABLE `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
AS
SELECT 
  GENERATE_UUID() AS review_id,
  review,
  title AS movie_title,
  movie_id,
  label AS imdb_sentiment_label,
  reviewer_rating,
  -- Extract sentiment using regex
  CASE 
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"sentiment":\s*"Positive"') THEN 'Positive'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"sentiment":\s*"Negative"') THEN 'Negative'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"sentiment":\s*"Neutral"') THEN 'Neutral'
    ELSE 'Unknown'
  END AS ai_sentiment,
  -- Extract category using regex
  CASE 
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Acting"') THEN 'Acting'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Plot"') THEN 'Plot'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Visuals"') THEN 'Visuals'
    WHEN REGEXP_CONTAINS(gemini_raw_output, r'"category":\s*"Sound"') THEN 'Sound'
    ELSE 'Other'
  END AS category,
  CURRENT_TIMESTAMP() AS processed_at
FROM `ai-doc-processor-kabilan.document_ai_us.temp_gemini_output`;

-- Verify final table
SELECT COUNT(*) AS final_rows 
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`;
