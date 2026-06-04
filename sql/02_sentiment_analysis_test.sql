-- ============================================
-- Test 2: Sentiment Analysis on 5 Reviews
-- ============================================
-- Direct sentiment analysis on IMDB public table

SELECT 
  review,
  label AS original_sentiment,
  reviewer_rating,
  title AS movie_title,
  ml_generate_text_result AS ai_analysis
FROM ML.GENERATE_TEXT(
  MODEL `ai-doc-processor-kabilan.document_ai_us.gemini_flash`,
  (
    SELECT 
      review,
      label,
      reviewer_rating,
      title,
      CONCAT(
        'Analyze this movie review. Return ONLY valid JSON. ',
        '{"sentiment":"Positive/Neutral/Negative","category":"Acting/Plot/Visuals/Sound/Other"}. ',
        'Review: "', SUBSTR(review, 1, 800), '"'
      ) AS prompt
    FROM `bigquery-public-data.imdb.reviews`
    WHERE review IS NOT NULL 
      AND LENGTH(review) > 50
    LIMIT 5
  ),
  STRUCT(
    0.2 AS temperature,
    300 AS max_output_tokens,
    TRUE AS flatten_json_output
  )
);
