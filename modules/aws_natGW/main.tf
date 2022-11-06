resource "aws_nat_gateway" "example" {
    allocation_id = var.elasticUp_id.id

    subnet_id = var.subnet_id

    tags = var.tags
}

variable "elasticUP_id" {

}

variable "subnet_id" {

}

variable "tags" {

}