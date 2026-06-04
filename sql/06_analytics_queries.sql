-- ============================================
-- Analytics Queries
-- ============================================

-- 1. Compare IMDB vs AI Sentiment
SELECT 
  imdb_sentiment_label,
  ai_sentiment,
  COUNT(*) AS count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
GROUP BY 1, 2
ORDER BY 1, 2;

-- 2. Category Performance by Sentiment
SELECT 
  category,
  ai_sentiment,
  COUNT(*) AS count,
  ROUND(AVG(reviewer_rating), 2) AS avg_rating
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
WHERE category IS NOT NULL
GROUP BY category, ai_sentiment
ORDER BY category, count DESC;

-- 3. Lowest Rated Reviews
SELECT 
  movie_title,
  LEFT(review, 150) AS review_preview,
  category,
  reviewer_rating
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
WHERE ai_sentiment = 'Negative'
ORDER BY reviewer_rating ASC
LIMIT 10;

-- 4. Highest Rated Reviews
SELECT 
  movie_title,
  LEFT(review, 150) AS review_preview,
  category,
  reviewer_rating
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
WHERE ai_sentiment = 'Positive'
ORDER BY reviewer_rating DESC
LIMIT 10;

-- 5. Sentiment and Category Breakdown
SELECT 
  ai_sentiment,
  category,
  COUNT(*) AS count
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
GROUP BY ai_sentiment, category
ORDER BY ai_sentiment, count DESC;

-- 6. Accuracy Calculation (IMDB vs AI)
SELECT 
  COUNT(*) AS total_reviews,
  SUM(CASE 
      WHEN (imdb_sentiment_label = 'positive' AND ai_sentiment = 'Positive')
        OR (imdb_sentiment_label = 'negative' AND ai_sentiment = 'Negative')
      THEN 1 ELSE 0 
  END) AS matches,
  ROUND(100.0 * SUM(CASE 
      WHEN (imdb_sentiment_label = 'positive' AND ai_sentiment = 'Positive')
        OR (imdb_sentiment_label = 'negative' AND ai_sentiment = 'Negative')
      THEN 1 ELSE 0 
  END) / COUNT(*), 2) AS accuracy_percent
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`;
