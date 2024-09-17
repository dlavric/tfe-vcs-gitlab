terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.58.1"
    }
  }
}

provider "tfe" {
  token    = var.token
  hostname = var.hostname
}


resource "tfe_oauth_client" "test" {
  name                = "gitlab-vcs"
  organization        = "test"
  api_url             = "https://gitlab.com/api/v4"
  http_url            = "https://gitlab.com"
  oauth_token         = var.gitlab_token_id
  service_provider    = "gitlab_hosted"
  organization_scoped = true
}

resource "tfe_workspace" "gitlab" {
  name         = "gitlab_workspace"
  organization = "test"
  tag_names    = ["test"]
  auto_apply   = true
  force_delete = true

  vcs_repo {
    identifier     = var.repository
    oauth_token_id = tfe_oauth_client.test.oauth_token_id

  }
  depends_on = [tfe_oauth_client.test]
}