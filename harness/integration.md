# Harness Intergration
Logical Resourcec hierarchy
  1) accounts > organizations > projects
- in side accounts we have mutiple organizations like one or more
- in side the organizations we have have multiple projects line or two
# Settings
  - Account level settings
  - Organization settings
  - Project level settings
# We have different components Harness
1) connectors
2) Secrets
3) Delegates
4) Templates
5) pipelines 
6) modules

# Genrally we have different secret managers
1) Harness Secret manager
3) AWS Secret Manager
4) HarshiCorp Vault
5) Azure Key Vault
6) GCP Secret Manager

## Delegates:
- Kubernetes bases delegate
- docker based delegate


- Master Orchestrator
- Network connectivity
- Sizing
- High Availability
- Mutual TLS Certificates
- Customized Delegates
- Delegate Scope
- Delegate Selectors
- Delegate Logs
## Connectors
Connectors enable the integration of the harness platform with exteranl systems by managing the authentication and authorizations settings needed
- Secrets Managers
- Source Code repositories
- artifact repositories
- cloud providers
- Monitoring and logging Systems
- Ticketing Systems

# pipeline
- Pipeline > Stages > steps
- In pipeline we have multiple stages each stage we have multiple steps
- pipelines are stored in the harness then it is called as inline pipeline
- pipelines are stored in the git hub repo then it is called as remote pipelines

# Types of stages
1) deploy stage
2) approval stage
3) pipeline stage
4) Custom stage

# types of steps
- step
  - in Step can add utilities like shell script, http,wait,file upload
  - in step can add harness approval,jira approvals
  - in step we can add jenkins,service
  - in step we can add terraform plan and apply
- step group 
- template

## Variables > Expressions > Runtimes
- 
## Input Set and Overlays
- Reuse single pipeline for multiple scenarios Define each scenario in input set or overlay at time run time
 ## Input Set
 - Input sets are collections of runtime inputs values for 
 ## overlays
 - overlays are group of input sets which enable you to pull runtime inputs from multiple inputs sets


## Build Infrastructure: Harness Cloud
- Harness hosted and managed build infrastrcture
- Run builds in dedicated, ephemeral VM's 
- Required for some advanced CI features

## Build Infrastrcture: Self Managed
 # kubernetes Cluster
  - Requires Kubernetes Connector and harness Delegate
 # Local Runner builds
  - Requires delegate and Local Docker Runner
  - Run Local build on linux,Mac and Windows
  - Can also use with any Cloud VM Services(AWS,Azure and GCP)
 # Note: Harness highly recommends using harness cloud for MacOS builds
  - where build code stored
  - Git repo with in harness code or external SCM provider
    - if external require associated code repo connector

 ## Trigger: Overview
  - Trigger are core component to automate and stream line deployment workflow
  - Execution of pipeline based on some event Ex:
    - Artifact/manifest
    - Scheduled Run
    - External Webhook
  - Decrease reliance on manual itervention during deployments
# Trigger CI Events
  - Most Commonly a Git Event
    - Branch created/updated/merged
    - PR created/updated/merged
    - New tag or rebase
    - Can Specify conditions











