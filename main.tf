module "vpc_modules" {
    
    source = "./modules/aws_vpc"


    for_each = var.vpc_config
    vpc_cidr_block = each.value.vpc_cidr_block
    tags = each.value.tags
}

module "aws_subnet" {
    
    source = "./modules/aws_subnets"

    for_each = var.subnet_config
    
    vpc_id = module.vpc_modules[each.value.vpc_name].vpc_id

    cidr_block = each.value.cidr_block

    availability_zone = each.value.availability_zone

    tags = each.value.tags
}


module "internetGW_module" {
    source = "./modules/aws_internetGw"

    vpc_id = ""

    tags = ""
}

module "NatGW_Module" {
    source = "./modules/aws_natGw"

    elasticIP_id = ""
    subnet_id = ""

    tags = ""
}

module "Elastic_IP_module" {
    source = "./modules/aws_elastic_IP"

    tags = ""  
}

module "route_table_module" {
    source = "./modules/aws_route_table"

    vpc_id = ""

    gateway_id = ""

    tags = ""
}

module "route_table_association" {
    source = "./modules/route_table_association"

    subnet_id = ""

    route_table_id = ""

}

aws_route_table_association_config = {
    RT01Assoc = {
        subnet_name = "public-us-east-1a"
        
        route_table_name = "RT01"
    }
    RT02Assoc = {
        subnet_name = "public-us-east-1a"

        route_table_name = "RT01"
    } 
    RT03Assoc = {
        subnet_name = "public-us-east-1a"

        route_table_name = "RT02"
    }  
    RT04Assoc = {
        subnet_name = "public-us-east-1a"

        route_table_name = "RT03"       
    }    
}