resource "ibm_container_worker_pool" "workerpool" {
    worker_pool_name = "tf-workerpool"
    machine_type     = "u3c.2x4"
    cluster          = ibm_container_cluster.tfcluster.id
    size_per_zone    = 2
    hardware         = "shared"

    resource_group_id = data.ibm_resource_group.resource_group.id
}

resource "ibm_container_worker_pool_zone_attachment" "tfwp-dal10" {
cluster         = ibm_container_cluster.tfcluster.id
worker_pool     = element(split("/",ibm_container_worker_pool.workerpool.id),1)
zone            = "dal10"
private_vlan_id = "<private_vlan_ID_dal10>"
public_vlan_id  = "<public_vlan_ID_dal10>"
resource_group_id = data.ibm_resource_group.resource_group.id
}

resource "ibm_container_worker_pool_zone_attachment" "tfwp-dal12" {
cluster         = ibm_container_cluster.tfcluster.id
worker_pool     = element(split("/",ibm_container_worker_pool.workerpool.id),1)
zone            = "dal12"
private_vlan_id = "<private_vlan_ID_dal12>"
public_vlan_id  = "<public_vlan_ID_dal12>"
resource_group_id = data.ibm_resource_group.resource_group.id
}

resource "ibm_container_worker_pool_zone_attachment" "tfwp-dal13" {
cluster         = ibm_container_cluster.tfcluster.id
worker_pool     = element(split("/",ibm_container_worker_pool.workerpool.id),1)
zone            = "dal13"
private_vlan_id = "<private_vlan_ID_dal13>"
public_vlan_id  = "<public_vlan_ID_dal13>"
resource_group_id = data.ibm_resource_group.resource_group.id
}