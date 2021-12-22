resource "azurerm_kubernetes_cluster" "k8s" {
    name                = "${local.resource_name_prefix}-${var.cluster_name}-${random_string.abinrandom.id}"
    location            = azurerm_resource_group.rsg.location
    resource_group_name = azurerm_resource_group.rsg.name
    dns_prefix          = "${local.resource_name_prefix}-${var.dns_prefix}-${random_string.abinrandom.id}"
/*
    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = file(var.ssh_public_key)
        }
    }
*/
    default_node_pool {
        name            = "nodepool"
        node_count      = var.node_count
        vm_size         = "Standard_D2_v2"
        os_disk_size_gb = 30
    }

    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }
/*
    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.test.id
        }
    }
*/

      role_based_access_control {    
          enabled = true  
          }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "kubenet"
    }
}