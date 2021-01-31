data "aws_ami" "debian" {

  most_recent = true
 
  filter {
    name   = "name"
    values = ["debian-10-amd64-*"]
  }

  owners = [ "136693071363" ] #Debian oficial

}

resource "aws_instance" "k8s" {
    ami           = data.aws_ami.debian.id
    for_each      = { for i, b in var.nome_no : b => { index = i } }
    instance_type = each.value.index < 1 ? "t2.micro" : "t3.medium"
    key_name      = "chave_aws"
    tags          = {  
      Name        = var.nome_no[each.value.index]
    }
}
