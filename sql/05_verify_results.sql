-- ============================================
-- Step 5: Verify Results
-- ============================================

-- Check sample data
SELECT 
  review_id,
  LEFT(review, 80) AS review_preview,
  movie_title,
  imdb_sentiment_label,
  ai_sentiment,
  category,
  reviewer_rating,
  processed_at
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
LIMIT 10;

-- Check sentiment distribution
SELECT 
  ai_sentiment,
  COUNT(*) AS count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
GROUP BY ai_sentiment
ORDER BY count DESC;

-- Check category distribution
SELECT 
  category,
  COUNT(*) AS count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
WHERE category != 'Other'
GROUP BY category
ORDER BY count DESC;
