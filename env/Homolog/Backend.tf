terraform {
  backend "s3" {
    bucket = "terraform-state-alura-kquesso"
    key    = "Prod/terraform.tfstate"
    region = "sa-east-1"
  }
}