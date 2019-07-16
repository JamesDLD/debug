Usage 
-----

With your Terraform template created, the first step is to initialize Terraform. 
This step ensures that Terraform has all the prerequisites to build your template in Azure.

```hcl

terraform init -backend-config="./variable/infra1_caas_backend.tfvars" -backend-config="./secret/infra1_caas_backend.json" -reconfigure

```

The next step is to have Terraform review and validate the template. 
This step compares the requested resources to the state information saved by Terraform and then outputs the planned execution. Resources are not created in Azure.
```hcl

terraform plan -var-file="./variable/infra1_caas_main.tfvars" -var-file="./secret/infra1_caas_main.json"

```

If all is ok with the proposal you can now apply the configuration.
```hcl

terraform apply -var-file="./variable/infra1_caas_main.tfvars" -var-file="./secret/infra1_caas_main.json" 

```

In order to delete the resources.
```hcl

terraform destroy -var-file="./variable/infra1_caas_main.tfvars" -var-file="./secret/infra1_caas_main.json"

```

