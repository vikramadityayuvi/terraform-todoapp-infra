locals {
  common_tags = {
    ManagedBy   = "Terraform"
    Owner       = "todoappTeam"
    Environment = "dev"
  }
}

module "rg" {
    source = "../../modules/azurerm_resource_group"
    rg_name     = "rg-dev-todoapp"
    rg_location = "East US"
    tags = local.common_tags  
  
}



module "acr" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_container_registry"
    acr_name = "acrdevtodoapp"
    location = "East US"
    rg_name  = "rg-dev-todoapp"
    tags = local.common_tags
  
}   


module "sql_server" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_sql_server"
    sql_server_name = "sqlserver-dev-todoapp"
    rg_name         = "rg-dev-todoapp"
    location        = "East US"
    admin_username  = "sqladminuser"
    admin_password  = "P@ssword1234"
    tags = local.common_tags
}


module "sql_db" {
    
    depends_on = [ module.sql_server ]
    source = "../../modules/azurerm_sql_database"
    sql_db_name     = "sqldb-dev-todoapp"
    server_id = module.sql_server.server_id
    max_size_gb = 10
    tags = local.common_tags
}


module "aks" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_kubernetes_cluster"
    aks_name    = "aksdevtodoapp"
    rg_name     = "rg-dev-todoapp"
    location    = "East US"
    dns_prefix  = "aksdevtodoapp"
    node_count  = 2
    vm_size = "Standard_DS2_v2"
    tags = local.common_tags
  
}