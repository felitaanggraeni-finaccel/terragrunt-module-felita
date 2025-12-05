locals {
  terraform_backend_s3_bucket = "terraform-remote-state-apse1-vn-6453f3a3019fe38a"
  tags = { # 5. specific tags per resource file
    "Entity" = "kvn"
  }
}
