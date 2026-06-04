-- ============================================
-- Sentiment and Category Breakdown
-- ============================================
-- Your working query from the conversation

SELECT 
  ai_sentiment,
  category,
  COUNT(*) AS count
FROM `ai-doc-processor-kabilan.document_ai_us.reviews_with_ai`
GROUP BY ai_sentiment, category
ORDER BY ai_sentiment, count DESC;
