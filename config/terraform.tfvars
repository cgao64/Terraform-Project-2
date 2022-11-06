region = "us-east-1"

access_key = ""
secret_key = ""

vpc_config = {

    vpc01 = {
        vpc_cidr_block = "192.168.0.0/16"

        tags = {
            "Name" = "my_vpc"
        }
    }
}

subnet_config = { 
    "public-us-east-1a" = {
        
        vpc_name = "vpc01"
        cidr_block = "192.168.0.0/18"
        availability_zone = "us-east-1a"
        tags = {
            "Name" = "public-us-east-1a"
        }
    }

    "public-us-east-1b" = {
        vpc_name = "vpc01"

        cidr_block = "192.168.64.0/18"
        availability_zone = "us-east-1b"
        tags = {
            "Name" = "public-us-east-1b"
        }
    }

    "private-us-east-1a" = {
        vpc_name = "vpc01"
        cidr_block = "192.168.128.0/18"
        availability_zone = "us-east-1a"
        tags = {
            "Name" = "public-us-east-1a"
        }
    }

    "private-us-east-1b" = {
        vpc_name = "vpc01"
        cidr_block = "192.168.192.0/18"
        availability_zone = "us-east-1b"
        tags = {
            "Name" = "public-us-east-1b"
        }
    }
}

internet_GW_config = {

    igw01 = {

        vpc_name = "vpc01"

        tags = {
            "Name" = "My_IGW"
        }
    }
}

elastic_IP_config = {
    eip01 = {
        tags = {
            "Name" = "nat01"
        }
    }

    eip02 = {
        tags = {
            "Name" = "nat02"
        }
    }   
}

nat_GW_config = {
    natgW01 = {
        eip_name = "eip01"
        subnet_name = "public-us-east-1a"

        tags = {
            "Name" = "natGW01"
        }
    }

    natgW02 = {
        eip_name = "eip02"
        subnet_name = "public-us-east-1b"

        tags = {
            "Name" = "natGW02"
        }
    }

}

aws_route_table_config = {

    RT01 = {
        vpc_name = "vpc01"
        gateway_name = "ipw01"

        tags = {
            "Name" = "Public-Route"
        }
    }

    RT02 = {
        vpc_name = "vpc01"
        gateway_name = "natgW01"

        tags = {
            "Name" = "Private-Route"
        }
    }

    RT03 = {
        vpc_name = "vpc01"
        gateway_name = "natgW02"

        tags = {
            "Name" = "Private-Route"
        }
    }
}

aws_route_table_association_config = {

}