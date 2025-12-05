locals {
  terraform_backend_s3_bucket = "terraform-remote-state-apse1-th-37a1a5afa30ce91c"
  tags = { # 5. specific tags per resource file
    "Entity" = "kth"
  }
}
