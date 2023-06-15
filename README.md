# minecraft-terraform

## Requirements
- [aws CLI, authenticated](https://aws.amazon.com/cli/)
- [terraform](https://developer.hashicorp.com/terraform/cli/commands)
- Public SSH key
- URL of desired minecarft server jar

## Overview
- A terraform script automates the setup of an EC2 instance. It provisions the necessary infrastructure, networking settings, security groups.
- A short bash script installs java, downloads the server jar, runs it, accepts the ELUA, and runs it again

## Tutorial 
`terraform init`
`terraform apply`

## Resources
- [Terraform docs](https://registry.terraform.io/)
- [A splash of AI guidance](https://chat.openai.com/)
- Some docs from the prev sysadmin? Weird guy...

