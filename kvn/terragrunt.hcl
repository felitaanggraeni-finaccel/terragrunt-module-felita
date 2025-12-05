include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  # 1. source from another module
  source = "git@github.com:felitaanggraeni/terraform-resource-test.git//modules/s3-bucket?ref=main"
}

inputs = {
  bucket_name = "${basename(get_terragrunt_dir())}-logs" # 3. resource name taken from directory name
  tags        = include.root.locals.tags
}
