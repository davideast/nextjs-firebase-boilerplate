gcloud config set run/platform managed
gcloud config set run/region us-central1
gcloud builds submit --tag gcr.io/<project-id>/nextjs
gcloud beta run deploy nextjs --image gcr.io/<project-id>/nextjs
firebase deploy
