locals {
  global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl")).locals
  local_vars  = (read_terragrunt_config("local.hcl", { locals = {} })).locals

  tags = merge(
    contains(keys(local.global_vars), "tags") ? local.global_vars.tags : {},
    contains(keys(local.local_vars), "tags") ? local.local_vars.tags : {}
  )
}

remote_state {
  backend = "s3"
  config = {
    # 2. dynamic state path based on folder name
    bucket = local.local_vars.terraform_backend_s3_bucket
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "ap-southeast-1"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}
