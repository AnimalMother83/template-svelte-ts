# Infrastructure 

## Requirements

- [Terraform v1.1.9] (https://www.terraform.io/downloads)

## Get started


Using `tfenv`:
- Install Terraform v.1.1.9 `tfenv install 1.1.9`
- Set to use `tfenv use 1.1.9`



### tfenv (Terraform version manager)


- Install `tfenv` ([instructions](https://github.com/tfutils/tfenv).
- Install latest Terraform `tfenv install latest`, or a specific version e.g. `tfenv install 1.1.9`
- Select version to use, e.g. `tfenv use 1.1.9` 

## Terraform

### Workspaces
- List workspaces `terraform workspace list`
- Create a new workspace `terraform workspace new <workspace_name>` 
- Select a workspace `terraform workspace select dev` 


# Azure

### Step 1. Create Azure storage account
Best practise, since otherwise state is stored locally.

Create storage group
```bash
az group create --name terraform-admin --location westeurope
  ```

Create storage account
```bash
az storage account create --name tfstg00 --resource-group terraform-admin --kind StorageV2 --sku Standard_LRS --https-only true --allow-blob-public-access false
```

Create SAS token for storage account
```bash
end=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
az storage account generate-sas --permissions cdlruwap --account-name tfstg00 --services qt --resource-types sco --expiry $end -o tsv
```

Create storage container using SAS token
```md
az storage container create --account-name tfstg00 --name terraform --public-access off --sas-token <sas-token>
```

### Step 2. Configure terraform to store state remote.

Create `azure.conf` with sas token. 
```conf
resource_group_name="terraform-admin"
storage_account_name="tfstg00"
container_name="terraform"
key="svelte-ts-demo-app.tfstate"
sas_token="<sas-token>"
```

Initiate terraform with `azure.conf`
```
terraform init -backend-config=azure.conf
```