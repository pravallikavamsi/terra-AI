Terraform-AI Project on GCP-GithubActions
********************************************
This project demonstrates a Terraform-based DevOps and AIOps workflow using Google Cloud Platform, GitHub Actions, Ollama AI, Slack notifications, drift detection, and controlled destroy workflows.
The main goal of this project is to validate Terraform infrastructure changes, generate Terraform plans, review them using a local AI model, and send meaningful reports to Slack and pull requests before applying infrastructure changes.
________________________________________
Project Overview
In this project, Terraform is used to provision infrastructure on Google Cloud Platform. A self-hosted GitHub Actions runner is used to execute Terraform workflows. The AI review is performed locally using Ollama running on the self-hosted runner.
The project includes:
•	Terraform infrastructure provisioning on GCP
•	Remote backend using Google Cloud Storage
•	GitHub Actions CI/CD workflows
•	Self-hosted GitHub Actions runner
•	Terraform validation and plan generation
•	TFLint for Terraform linting
•	Checkov for security and compliance scanning
•	AI-based Terraform plan review using Ollama
•	Slack notifications
•	Terraform drift detection
•	Manual production apply workflow
•	Manual destroy workflow
________________________________________
Project Structure
.
├── .github/
│   └── workflows/
│       ├── terraform-pr-review.yml
│       ├── terraform-prod-apply.yml
│       ├── terraform-drift-detection.yml
│       └── terraform-destroy.yml
│
├── ai/
│   ├── ai_review.py
│   └── slack_send.py
│
├── envs/
│   ├── dev.tfvars
│   └── prod.tfvars
│
├── backend.tf
├── backend-dev.hcl
├── backend-prod.hcl
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf
├── .tflint.hcl
├── .gitignore
└── README.md

