# Techniques and Approaches Used in This Book

This section provides examples of techniques and approaches we perform throughout the book to make the recipe steps easier to follow. You can skip over these topics if you feel comfortable with them. You can always come back and reference this section.

## Querying outputs, environment variables, and command substitution
Sometimes when subsequent commands depend on outputs from the command you are currently running. The AWS CLI provides the ability for [client-side filtering](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html#cli-usage-filter-client-side) of output. At times, we will set [environment variables](https://en.wikipedia.org/wiki/Environment_variable) that contain these outputs by leveraging [command substitution](https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html).

We’ll combine these three techniques to make things easier for you as you proceed through steps in the book. Here is an example:

Use the AWS Security Token Service (AWS STS) to retrieve your IAM user (or role) Amazon Resource Name (ARN) with the AWS CLI:
```
aws sts get-caller-identity
```
You should see output similar to the following:
```
{
  "UserId": "EXAMPLE",
  "Account": "111111111111",
  "Arn": "arn:aws:iam::111111111111:user/UserName"
}
```
An example of querying for the ARN value and outputting it to the terminal follows:
```
aws sts get-caller-identity --query Arn --output text
```
You should see output similar to the following:
```
arn:aws:iam::111111111111:user/UserName
```
Query for the ARN value and set it as an environment variable using command substitution:
```
PRINCIPAL_ARN=$(aws sts get-caller-identity --query Arn --output text)
```
To check the value of an environment variable, for example, you can echo it to the terminal:
```
echo $PRINCIPAL_ARN
```
You should see output similar to the following:
```
arn:aws:iam::111111111111:user/UserName
```
> TIP: Using the --dry-run flag is always a good idea when performing an operation that makes changes—for example, aws ec2 create-vpc --dry-run --cidr-block 10.10.0.0/16.

## Replacing values in provided template files
Where possible, to simplify the learning experience for you, we have provided template files in the chapter code repositories that you can use as a starting point as input to some of the commands you will run in recipe steps. For example, when you create an AWS CodeDeploy configuration in [Recipe 6.5](https://github.com/AWSCookbook/Containers/tree/main/605-Updating-Containers-With-BlueGreen), we provide codedeploy-template.json with `AWS_ACCOUNT_ID`, `PROD_LISTENER_ARN`, and `TEST_LISTENER_ARN` placeholders in the JSON file. We expect you to replace these placeholder values and save the file as codedeploy.json.

To further simplify your experience, if you follow the steps exactly and save these to environment variables, you can use the `sed` command to replace the values. Where possible, we provide you a command to do this, such as this example from [Chapter 6](https://github.com/AWSCookbook/Containers):

Use the `sed` command to replace the values with the environment variables you exported with the helper.py script:
```
sed -e "s/AWS_ACCOUNT_ID/${AWS_ACCOUNT_ID}/g" \
     -e "s|PROD_LISTENER_ARN|${PROD_LISTENER_ARN}|g" \
     -e "s|TEST_LISTENER_ARN|${TEST_LISTENER_ARN}|g" \
     codedeploy-template.json > codedeploy.json
```
## Passwords
During some of the steps in the recipes, you will create passwords and temporarily save them as environment variables to use in subsequent steps. Make sure you unset the environment variables by following the cleanup steps when you complete the recipe. We use this approach for simplicity of understanding. A more secure method (such as the method in [Recipe 1.8](https://github.com/AWSCookbook/Security/tree/main/108-Storing-Encrypting-Accessing-Passwords)) should be used in production environments by leveraging AWS Secrets Manager.

### Generation
You can use AWS Secrets Manager via the AWS CLI to [generate passwords](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/secretsmanager/get-random-password.html) with specific requirements. An example from [Chapter 4](https://github.com/AWSCookbook/Databases) looks like this:
```
ADMIN_PASSWORD=$(aws secretsmanager get-random-password \
     --exclude-punctuation \
     --password-length 41 --require-each-included-type \
     --output text \
     --query RandomPassword)
```
### Usage and storage
In production environments, you should use [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) or [AWS Systems Manager Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html) (using secure strings) with IAM policies to control who and what can access the secrets. For simplicity, some of the policies of passwords and secrets used in the recipes might not be as locked down from a policy perspective as you would want in a production environment. Be sure to always write your own IAM policies to control this behavior in practice.

## Random suffixes
We generate a lot of random suffixes when we deal with global services like Amazon S3. These are needed because S3 bucket names need to be globally unique across the entire AWS customer base. Secrets Manager can be used via the CLI to generate a string that satisfies the naming convention and adds this random element to ensure all book readers can create resources and follow along using the same commands:
```
RANDOM_STRING=$(aws secretsmanager get-random-password \
     --exclude-punctuation --exclude-uppercase \
     --password-length 6 --require-each-included-type \
     --output text \
     --query RandomPassword)
```
You can also use any other utilities to generate random strings. Some local tools may be preferred.

The resource (example S3 bucket) can then be created with a command like this:
```
aws s3api create-bucket --bucket awscookbook801-$RANDOM_STRING
```


## AWS Cloud Development Kit and helper.py
A good place to start is the [“Getting started with the AWS CDK” guide](https://docs.aws.amazon.com/cdk/v2/guide/getting_started.html). After you have CDK 2.0 installed, if this is the first time you are using the AWS CDK, you’ll need to bootstrap with the Region you are working on with the AWS CDK toolkit:
```
cdk bootstrap aws://$AWS_ACCOUNT_ID/$AWS_REGION
```
We use the AWS CDK when needed throughout the book to give you the ability to deploy a consistent scenario that aligns with the problem statement you see in the recipe. You can also choose to execute the recipe steps in your own existing environments, as long as you have the input variables required for the recipe steps. If things don’t work in your environment, you can stand up the provided environment and compare.

The CDK code we included in the repositories deploys resources using the AWS CloudFormation service, and we wrote output variables that you use in recipe steps. We created a Python script called helper.py which you can run in your terminal to take the CloudFormation output and set local variables to make the recipe steps easier to follow—in most cases, even copy and paste.

An example set of commands for deploying CDK code for a recipe after checking out the chapter repository for [Chapter 4](https://github.com/AWSCookbook/Databases), looks like the following:
```
cd 401-Creating-an-Aurora-Serverless-DB/cdk-AWS-Cookbook-401/
test -d .venv || python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
cdk deploy
```
You can easily copy and paste the preceding code from the root of the chapter repository (assuming you have Python, pip, and CDK installed as prerequisites) to deploy the scenario that the solution will address in the solution steps of the recipe.

The helper.py tool we created can then be run in your terminal after the `cdk deploy` is complete:
```
python helper.py
```
You should see output that you can copy and paste into your terminal to set environment variables from the CDK CloudFormation stack outputs:
```
$ python helper.py
Copy and paste the commands below into your terminal
ROLE_NAME='cdk-aws-cookbook-108-InstanceSS1PK7LB631QYEF'
INSTANCE_ID='random string here'
```
> NOTE: Finally, a reminder that although we work for AWS, the opinions expressed in this book are our own.

Put on your apron, and let’s get cooking with AWS!

