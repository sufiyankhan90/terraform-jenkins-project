# --- root/backend.tf ---

terraform {
  backend "s3" {
    bucket = "sufiyan-terraform-jenkins-state"
    key    = "remote.tfstate"
    region = "us-east-1"
  }
}
