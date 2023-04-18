# Requirements

Here are the requirements to get started and some tips on where to find assistance:

* AWS account
  * [Setup instructions](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
  * An IAM user with console and programmatic access
  * Administrator privileges for your IAM user
* Personal computer/laptop
* Software
  * Terminal with bash or Z shell (Zsh)
  * Git
    * [Install instructions](https://github.com/git-guides/install-git)
  * Homebrew (optional but recommended to install other requirements)
    * [Install instructions](https://docs.brew.sh/Installation)
  * Code editor (e.g., VSCodium or AWS Cloud9)
    * Recommended install: `brew install --cask vscodium`
  * AWS CLI version 2 (2.1.26 or later)
    * [Install guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
    * Recommended install: brew install awscli@2
  * Python 3.7.9 (and pip) or later
    * Example install: `brew install python3`
  * AWS Cloud Development Kit version 2.0 or later
    * [Getting started guide](https://docs.aws.amazon.com/cdk/v2/guide/getting_started.html)
    * Recommended install: `brew install npm && npm i -g aws-cdk`
  * Web browser (e.g., Microsoft Edge, Google Chrome, or Mozilla Firefox) when AWS Console access is needed

Recommended: Create a folder in your home directory called AWSCookbook. This will allow you to clone each chapter’s repository in one place:
```
AWSCookbook:$ tree -L 1
.
├── ArtificialIntelligence
├── BigData
```

> NOTE: The code we have provided is written for version 2. You can find out more information about how to migrate to and install CDK version 2 in this [AWS CDK v2 article](https://aws.amazon.com/blogs/developer/announcing-aws-cloud-development-kit-v2-developer-preview/).

#  Setup
In addition to the installation of the prerequisites listed previously, you will need the following access.

### AWS account setup
You will need a user with administrative permissions. Some of the recipes require the ability to create AWS Identity and Access Management (IAM) resources. You can follow the AWS guide for creating your first IAM admin user and user group.

### General workstation setup steps for CLI recipes
We have created a group of code repositories available at https://github.com/awscookbook. Create a folder called AWSCookbook in your home directory (or any place of your choosing) and cd there:
```
mkdir ~/AWSCookbook && cd ~/AWSCookbook
```
This will give you a place to check out chapter repositories (e.g., Security):
```
git clone https://github.com/AWSCookbook/Security
```
Set and export your default Region in your terminal:
```
export AWS_REGION=us-east-1
```

> TIP: AWS offers many Regions across the world for cloud deployments. We’ll be using the us-east-1 Region for simplicity. As long as the services are available, there is no reason these recipes won’t work in other Regions. AWS has a list of [Regions and services](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/).

Set your AWS ACCOUNT_ID by parsing output from the `aws sts get-caller-identity` operation:
```
AWS_ACCOUNT_ID=$(aws sts get-caller-identity \
     --query Account --output text)
```

> NOTE: The `aws sts get-caller-identity` operation “returns details about the IAM user or role whose credentials are used to call the operation.”

Validate AWS Command Line Interface (AWS CLI) setup and access:
```
aws ec2 describe-instances
```

If you don’t have any EC2 instances deployed, you should see output similar to the following:
```
{
  "Reservations": []
}
```
> NOTE: AWS CLI version 2 will by default send command output with multiple lines to less in your terminal. You can type q to exit. If you want to override this behavior, you can modify your ~/.aws/config file to remove this default functionality.

> TIP: AWS CloudShell is a browser-based terminal that you can use to quickly create a terminal environment in your authenticated AWS Console session to run AWS CLI commands from. By default, it uses the identity of your browser session to interact with the AWS APIs. Many of the recipes can be run using CloudShell. You can use CloudShell to run recipe steps, clean up commands, and other AWS CLI commands as your authenticated user, if you do not want to create a session that you use in your own local terminal environment on your workstation.
