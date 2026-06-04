z# 🎬 Intelligent Document Processor with BigQuery ML + Gemini

## Project Overview
An AI-powered sentiment analysis pipeline that processes IMDB movie reviews using Google's Gemini 2.5 Flash Lite model directly within BigQuery.

## Architecture

BigQuery Public Dataset (IMDB Reviews)
↓
ML.GENERATE_TEXT() with Gemini 2.5 Flash Lite
↓
JSON Parsing & Regex Extraction
↓
Enriched Table (reviews_with_ai)



## Tech Stack
- **Google Cloud Platform** - BigQuery, Vertex AI, Cloud Shell
- **AI Model** - Gemini 2.5 Flash Lite
- **Language** - SQL (BigQuery Syntax)

## Features
- ✅ Sentiment Analysis (Positive/Neutral/Negative)
- ✅ Category Extraction (Acting/Plot/Visuals/Sound/Other)
- ✅ Batch processing of 500+ reviews
- ✅ Near-zero cost (~$0.01)

## Quick Start

### Prerequisites
- GCP account with billing enabled (free tier covers this project)
- BigQuery API, Vertex AI API enabled

### Setup Instructions

1. **Create Dataset & Connection**
   ```sql
   -- Run setup/01_create_dataset.sql
   -- Run setup/02_create_connection.sql
   -- Run setup/03_create_model.sql
2. Grant Permissions
    chmod +x setup/04_grant_permissions.sh
./setup/04_grant_permissions.sh

3. Test Connection
   -- Run sql/01_test_gemini_connection.sql

4. Run Sentiment Analysis Test
   -- Run sql/02_sentiment_analysis_test.sql

5. Run Full Pipeline
   -- Run sql/03_create_temp_table.sql
   -- Run sql/04_create_enriched_table.sql

6. Verify & Analyze
   -- Run sql/05_verify_results.sql
   -- Run sql/06_analytics_queries.sql

### Results Summary
Reviews Processed: 500+

Sentiment Distribution: Positive/Neutral/Negative

Categories: Acting, Plot, Visuals, Sound, Other

Cost: < $0.01

