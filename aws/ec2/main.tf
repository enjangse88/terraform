provider "aws" {
    region = "region_zone"
}

resource "aws_instance" "instance" {
    ami = "ami-0005e0cfe09cc9050"
    instance_type = "t2.micro"

    tags = {
        Name = "example_instance_name"
    }

}