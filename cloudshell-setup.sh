#Set your AWS ACCOUNT ID by parsing output from the aws sts get-caller-identity operation.
AWS_ACCOUNT_ID=$(aws sts get-caller-identity \
--query Account --output text)

#Create a folder called AWSCookbook abd cd into it
test -d AWSCookbook || mkdir AWSCookbook 
cd AWSCookbook

#Example: Checkout Chapter repos
test -d Security || git clone https://github.com/AWSCookbook/Security
