#!/bin/bash
# ============================================
# Step 4: Grant Required Permissions
# ============================================
# Replace SA_EMAIL with your service account email

SA_EMAIL="bqcx-13330984901-g4qk@gcp-sa-bigquery-condel.iam.gserviceaccount.com"
PROJECT="ai-doc-processor-kabilan"

echo "Granting permissions to service account: $SA_EMAIL"
echo "Project: $PROJECT"
echo ""

for role in bigquery.dataViewer bigquery.jobUser bigquery.dataEditor bigquery.connectionUser aiplatform.user; do
  echo "Granting $role..."
  gcloud projects add-iam-policy-binding $PROJECT \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/$role"
done

echo ""
echo "✅ All permissions granted!"
echo "⏱️ Wait 1-2 minutes for permissions to propagate."
