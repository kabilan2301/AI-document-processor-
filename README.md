# 🎬 Intelligent Document Processor with BigQuery ML + Gemini

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
