data "aws_ami" "debian" {

  most_recent = true
 
  filter {
    name   = "name"
    values = ["debian-10-amd64-*"]
  }

  owners = [ "136693071363" ] #Debian oficial

}

resource "aws_instance" "k8s" {
    count         = lenght(var.nome_no)
    ami           = data.aws_ami.debian.id
    for_each      = { for i, b in var.tipo_recurso : b => { index = i } }
    instance_type = each.key
    key_name      = "chave_aws"
    tags          = {  
      Name        = var.nome_no[each.value.index]
    }
}
