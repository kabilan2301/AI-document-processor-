# Cost Analysis

## Project Cost Breakdown

| Service | Free Tier Limit | Usage | Cost |
|---------|----------------|-------|------|
| BigQuery Query Processing | 1 TB/month | ~10 MB | $0.00 |
| BigQuery Storage | 10 GB/month | <1 MB | $0.00 |
| Vertex AI (Gemini 2.5 Flash Lite) | Pay-as-you-go | 500 reviews × ~500 chars | ~$0.0001 |

**Total Estimated Cost: < $0.01**

## Cost Optimization Tips

1. **Use LIMIT clause** while testing
2. **Use SUBSTR(review, 1, 800)** to reduce tokens
3. **Batch process** instead of real-time
4. **Drop temp tables** after final table is created
5. **Use gemini-2.5-flash-lite** (most cost-effective)

## Token Usage Estimate
- Average review length: 500 characters
- Prompt tokens per review: ~150
- Response tokens per review: ~30
- Total for 500 reviews: ~90,000 tokens
- Cost at $0.00025/1K tokens: ~$0.0225

## Actual Cost for This Project
This project processed 500 reviews and cost approximately **$0.01 USD** - essentially free.

## Cleanup (To Avoid Future Charges)
```sql
-- Drop temp table when done
DROP TABLE IF EXISTS `ai-doc-processor-kabilan.document_ai_us.temp_gemini_output`;
