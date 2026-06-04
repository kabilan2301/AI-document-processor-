-- ============================================
-- Test 1: Verify Gemini Model is Working
-- ============================================

SELECT *
FROM ML.GENERATE_TEXT(
  MODEL `ai-doc-processor-kabilan.document_ai_us.gemini_flash`,
  (SELECT "Say 'Gemini is working perfectly!'" AS prompt),
  STRUCT(
    0.2 AS temperature,
    100 AS max_output_tokens,
    TRUE AS flatten_json_output
  )
);
