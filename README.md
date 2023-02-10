# project-1

- The project has four files, main.tf, providers.tf, variable.tf, amd output.tf.
- Each of these files have blocks to do their intended jobs; such as 
    - providers.tf has providers blocks; azure and aws

    - main.tf stores all resources. These resources
        - create two users on Azure; through two different blocks
        - create four users on AWS; through for_each meta argument
        - create two S3 buckets; through count meta argument
        - create a resource group, virtual machine and storage account on Azure
        - the entire configuration has two tags; one in S3 bucket and other one in storage account
        - each resource use the variables stored in variable.tf

    - variable.tf stores all the variables used in resources blocks
    
    - output.tf prints
        - whether the "me" user's password is exempt from expiring
        - the resource group "rg" id