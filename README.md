# Overview

Every Chef installation needs a Chef Repository. This is the place where cookbooks, roles, config files and other artifacts for managing systems with Chef will live. We strongly recommend storing this repository in a version control system such as Git and treat it like source code.

While we prefer Git, and make this repository available via GitHub, you are welcome to download a tar or zip archive and use your favorite version control system to manage the code.

# Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `roles/` - Store roles in .rb or .json in the repository.
- `environments/` - Store environments in .rb or .json in the repository.

# Configuration

The config file, `.chef/knife.rb` is a repository specific configuration file for knife. If you're using the Chef Platform, you can download one for your organization from the management console. If you're using the Open Source Chef Server, you can generate a new one with `knife configure`. For more information about configuring Knife, see the Knife documentation.

<https://docs.chef.io/knife.html>

# Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.

# Launching Droplet

`export DO_PAT={YOUR_PERSONAL_ACCESS_TOKEN}`

`ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub | awk '{print $2}' | sed 's/MD5://g'`

copy output and `export SSH_FINGERPRINT=COPIED_FINGERPRINT`

`export TF_LOG=TRACE`

`terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa" \
  -var "ssh_fingerprint=$SSH_FINGERPRINT"`


`terraform apply \
-var "do_token=${DO_PAT}" \
-var "pub_key=$HOME/.ssh/id_rsa.pub" \
-var "pvt_key=$HOME/.ssh/id_rsa" \
-var "ssh_fingerprint=$SSH_FINGERPRINT"`


`terraform show terraform.tfstate`

`terraform refresh \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa" \
  -var "ssh_fingerprint=$SSH_FINGERPRINT"`


`terraform plan -destroy -out=terraform.tfplan \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa" \
  -var "ssh_fingerprint=$SSH_FINGERPRINT"`


`terraform apply terraform.tfplan`



Ref: https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean