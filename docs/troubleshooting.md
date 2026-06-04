# Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Access Denied on Public Dataset
**Error:** `Access Denied: Table bigquery-public-data:imdb.reviews`

**Solution:** 
- Use two-step process (temp table → final table)
- Copy data to your project first

### Issue 2: AI Sentiment Returns NULL
**Error:** `ai_sentiment` column has NULL values

**Solutions:**
1. Use `ml_generate_text_result` (not `ml_generate_text_llm_result`)
2. Set `flatten_json_output = TRUE`
3. Use regex extraction instead of JSON_VALUE
4. Create temp table first, then parse

### Issue 3: Region Mismatch
**Error:** Cannot query across different regions

**Solution:**
- IMDB data is in `US` multi-region
- Your dataset must also be in `US` region
- Do NOT use `us-central1` for this project

### Issue 4: Permission Errors
**Error:** Service account cannot access resources

**Solution:**
- Run `setup/04_grant_permissions.sh`
- Wait 1-2 minutes for permissions to propagate
- Verify service account email is correct

### Issue 5: JSON Parsing Fails
**Error:** Gemini returns JSON wrapped in markdown backticks

**Solution:**
- Use `REGEXP_CONTAINS` with regex patterns
- Example: `WHEN REGEXP_CONTAINS(output, r'"sentiment":\s*"Positive"')`

### Issue 6: Wrong Column Name
**Error:** `ml_generate_text_llm_result` not found

**Solution:**
- Use `ml_generate_text_result` (correct column name)
- The `_llm_` version does not exist
