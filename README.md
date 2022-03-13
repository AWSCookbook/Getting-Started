[Requirements and Setup](RequirementAndSetup.md)

[Techniques and Approaches Used in This Book](TechniquesAndApproachesUsedinThisBook.md)

[Foreword](Foreword.md)

[Acknowledgments](Acknowledgments.md)

[List of FREE recipes!](https://github.com/AWSCookbook/Getting-Started/blob/main/ListOfFreeRecipes.md)

# Preface

> The vast majority of workloads will go to the cloud. We’re just at the beginning—there’s so much more to happen. -- [Andy Jassy](https://www.forbes.com/sites/siliconangle/2015/01/28/andy-jassy-aws-trillion-dollar-cloud-ambition/?sh=120bdcdb321e)


Cloud usage has been gaining traction with enterprises and small businesses over the last decade and continues to accelerate. Gartner said the worldwide infrastructure as a service (IaaS) public cloud services market [grew 40.7% in 2020](https://www.gartner.com/en/newsroom/press-releases/2021-06-28-gartner-says-worldwide-iaas-public-cloud-services-market-grew-40-7-percent-in-2020). The rapid growth of the cloud has led to a [huge demand](https://www.gartner.com/en/newsroom/press-releases/2019-01-17-gartner-survey-shows-global-talent-shortage-is-now-the-top-emerging-risk-facing-organizations) for cloud skills by many organizations. Many IT professionals understand the basic concepts of the cloud but want to become more comfortable working in the cloud. This gap between the supply and demand of cloud skills presents a significant opportunity for individuals to level up their career.

Through our combined 20+ years of cloud experience, we have had the benefit of working on Amazon Web Services (AWS) projects in many different roles. We have provided guidance to hundreds of developers on how and when to use AWS services. This has allowed us to understand the common challenges and easy wins of the cloud. We would like to share these lessons with you and give you a leg up for your own advancement. We wrote this book to share some of our knowledge and enable you to quickly acquire useful skills for working in the cloud. We hope that you will find yourself using this book as reference material for many years to come.

## Who This Book Is For
This book is for developers, engineers, and architects of all levels, from beginner to expert. Beginners will learn cloud concepts and become comfortable working with cloud services. Experts will be able to examine code used to stand up recipe foundations, explore new services, and gain additional perspectives. If the plethora of cloud services and combinations seem overwhelming to you, then this book is for you. The recipes in this book aim to provide “Hello, World” proofs of concept and components of enterprise-grade applications. This will be accomplished using common use cases with guided walk-throughs of scenarios that you can directly apply to your current or future work. These curated and experience-building recipes are meant to demystify services and will immediately deliver value, regardless of your AWS experience level.

## What You Will Learn
In addition to opening up new career opportunities, being able to harness the power of AWS will give you the ability to create powerful systems and applications that solve many interesting and demanding problems in our world today. Would you like to handle 60,000 cyber threats per second using AWS machine learning like [Siemens](https://aws.amazon.com/solutions/case-studies/siemens/) does? Or reduce your organization’s on-premises footprint and expand its use of microservices like [Capital One](https://aws.amazon.com/solutions/case-studies/capital-one/) has? If so, the practical examples in this book will help expedite your learning by providing tangible examples showing how you can put the building blocks of AWS together to form practical solutions that address common scenarios. The on-demand consumption model, vast capacity, advanced capabilities, and global footprint of the cloud create new possibilities that need to be explored.

## The Recipes
We break the book into chapters that focus on general areas of technology (e.g., security, networking, artificial intelligence, etc.). The recipes contained within the chapters are bite-sized, self-contained, and easily consumable. Recipes vary in length and complexity. Each recipe has a problem statement, solution (with diagram), and discussion. Problem statements are tightly defined to avoid confusion. Solutions contain required preparation and steps to walk you through the work needed to accomplish the goal. When appropriate, explicit validation checks will be provided. We’ve also added extra challenges to the recipes to help you advance your learning if you wish to do so. Finally, we end each recipe with a short discussion to help you understand the solution and why it matters, suggestions to extend the solution, and ways to utilize it for real impact.

> Note: To keep your AWS bill low and keep your account tidy, each recipe has cleanup steps provided in the repositories associated with the book.

Each chapter has its own repository at https://github.com/awscookbook. The repository contains preparation steps for easy copying and pasting, required files, and infrastructure as code. We have also created GitHub templates for reporting bugs and suggesting new recipes. We encourage you to leverage GitHub to submit issues, create requests for new recipes, and submit your own pull requests. We will actively maintain the chapter repositories with updates for recipe steps and code in the README files of each recipe. Be sure to check these for any new or alternative approaches. We look forward to interacting with you on GitHub with new fun challenges and hints to assist you.

Some recipes are “built from scratch,” and others include preparation steps to allow you to interact with common scenarios seen in the real world. We have provided code to enable you to easily deploy the prerequisites. For example, Recipe 6.5, assumes that you are a container developer creating an application deployment that requires an existing network stack. When prerequisites exist, they can be “pre-baked” with preparation steps using code provided in the repositories. When substantial preparation for a recipe is needed, you will use the AWS Cloud Development Kit (CDK), which is a fantastic tool for intelligently defining and declaring infrastructure. The majority of the recipes are CLI based; when appropriate, we use console walk-throughs including screenshots or descriptive text.

> Note: There are many ways to achieve similar outcomes on AWS; this book will not be an exhaustive list. Many factors will dictate the best overall solution for your use case. We have selected recipe topics to help you learn about AWS and make the best choices for your specific needs.

You’ll find recipes for things like the following:
* Redacting personally identifiable information (PII) from text by using Amazon Comprehend
* Automating password rotation for Amazon Relational Database Service (RDS) databases
* Using VPC Reachability Analyzer to verify and troubleshoot network paths

Along with the recipes, we also provide short lines of code in the [Appendix](https://github.com/AWSCookbook/HerbsAndSpices/) that will quickly accomplish valuable and routine tasks. We feel that these are great tidbits to add to your cloud toolbox.

> Warning: AWS has a [free tier](https://aws.amazon.com/free/), but implementing recipes in this book could incur costs. We provide cleanup instructions, but you are responsible for any costs in your account. We recommend checking out the [Well-Architected Labs](https://www.wellarchitectedlabs.com/) developed by AWS on expenditure awareness and leveraging [AWS Budgets actions](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-controls.html) to control costs.
