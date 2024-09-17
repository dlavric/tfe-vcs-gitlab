# tfe-vcs-gitlab
this is a repository that will use the tfe provider to manage the vcs connection to gitlab

# Pre-requisites
- Have a Gitlab account
- Have a repository on Gitlab
- Have a Personal Access Gitlab token. How to create the Gitlab token in Gitlab:

https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token



- Make sure to create a file `variables.auto.tfvars` and add the following information to it: 
```sh
gitlab_token_id = "glpat-rhri..."                   # gitlab personal access token
repository     = "dlavric/terraform-null"           # repository they should all be connected to
token          = "jfhis...."                        # tfe token
hostname       = "tfe.daniela.sbx.hashidemos.io"    # hostname of your TFE environment
```

# How to use
- Clone the repository:
```sh 
git clone git@github.com:dlavric/tfe-vcs-gitlab.git
```

- Initialize the providers
```sh
terraform init
```

- Create the infrastructure
```sh
terraform apply
```

- Destroy the infrastructure
```sh
terraform destroy
```
