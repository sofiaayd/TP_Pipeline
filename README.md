# TP_Pipeline

## Terraform commands :
    apply --           Builds or changes infrastructure
    console --         Interactive console for Terraform interpolations
    destroy   --       Destroy Terraform-managed infrastructure
    env  --            Workspace management
    fmt  --            Rewrites config files to canonical format
    get  --            Download and install modules for the configuration
    graph  --          Create a visual graph of Terraform resources
    import  --         Import existing infrastructure into Terraform
    init    --         Initialize a Terraform working directory
    output             Show output values from your root module
    plan               Show changes required by the current configuration
    providers          Prints a tree of the providers used in the configuration
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management


# How to create a Kinesis Applications
You have to create:
- Kinesis stream
- S3 bucket for backup
- A kinesis firehose to S3 for backing up every record
- A lambda to copy from the stream to the firehose
- Log Cloudwatch errors for the firehose
- All applicable IAM roles and policies, including a read-only role for KCL applications


To get the module from github/gitlab:
bash
terraform get

## Schema infrastructure

![Schema](/infra.png)

## Schema data flow

![Schema](/dataflow.png)

## Explainations of my work 

For this work, I proceeded in three main steps:
- I set up and configured the infrastructure for kinesis
- I gathered the infrastructure configuration with the business logic and executed it locally
- Then I realized the AWS part.
