module "qa" {
    source = "../modules/blog"

    environment = {
        name           = "qa"
        network_prefix = "10.1"
    }

    
    asg_min_size = 0
    asg_max_size = 0
}