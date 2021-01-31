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
    for_each      = toset(var.tipo_recurso)
    instance_type = each.key
    key_name      = "chave_aws"
    tags          = {  
      Name        = index(var.nome_no, each.value)
    }
}
