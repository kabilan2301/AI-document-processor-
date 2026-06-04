-- ============================================
-- Step 3: Create Temporary Table with Raw Gemini Output
-- ============================================
-- This is a two-step process to ensure proper JSON parsing
-- The temp table stores raw output before extraction

CREATE OR REPLACE TABLE `ai-doc-processor-kabilan.document_ai_us.temp_gemini_output`
AS
SELECT 
  review,
  title,
  movie_id,
  label,
  reviewer_rating,
  ml_generate_text_result AS gemini_raw_output
FROM ML.GENERATE_TEXT(
  MODEL `ai-doc-processor-kabilan.document_ai_us.gemini_flash`,
  (
    SELECT 
      review,
      title,
      movie_id,
      label,
      reviewer_rating,
      CONCAT(
        'Analyze this movie review. Return ONLY valid JSON. ',
        '{"sentiment":"Positive/Neutral/Negative","category":"Acting/Plot/Visuals/Sound/Other"}. ',
        'Review: "', SUBSTR(review, 1, 800), '"'
      ) AS prompt
    FROM `bigquery-public-data.imdb.reviews`
    WHERE review IS NOT NULL 
      AND LENGTH(review) > 50
    LIMIT 500
  ),
  STRUCT(
    0.2 AS temperature,
    300 AS max_output_tokens,
    TRUE AS flatten_json_output
  )
);

-- Verify temp table
SELECT COUNT(*) AS rows_processed 
FROM `ai-doc-processor-kabilan.document_ai_us.temp_gemini_output`;
