# Install Zabbix Terraform provider

https://github.com/dainis/terraform-provider-zabbix

```
wget https://github.com/dainis/terraform-provider-zabbix/releases/download/v0.0.3/terraform-provider-zabbix_0.0.3.tar.gz
mkdir ~/.terraform.d/plugins/linux_amd64/
tar -C ~/.terraform.d/plugins/linux_amd64/ -xzf terraform-provider-zabbix_0.0.3.tar.gz \
terraform-provider-zabbix/linux_amd64/terraform-provider-zabbix
```

# Set provider credentials

Export environment variables and optionally add lines also to `~/.bashrc`:
```
export TF_VAR_zabbix_user=myuser
export TF_VAR_zabbix_password=mypassword
export TF_VAR_zabbix_server_url=https://zabbix.local/api_jsonrpc.php
```

# Example Terarform configuration

```
variable "zabbix_user" {}
variable "zabbix_password" {}
variable "zabbix_server_url" {}

provider "zabbix" {
  user = "${var.zabbix_user}"
  password = "${var.zabbix_password}"
  server_url = "${var.zabbix_server_url}"
}

resource "zabbix_host_group" "project" {
  name = "opshost_${var.partner_name}_${var.project_name}"
}

module "zabbix_host" {
  source = "github.com/opshost/terraform-zabbix-host"
  host = "${var.project_name}-prod"
  name = "${var.hostname_prod}"
  ip = "${google_compute_address.prod.address}"
  groups = [ "opshost", "opshost_sla_8x5", "opshost_${var.partner_name}", "${zabbix_host_group.project.name}"]
  templates = ["opshost_drupal"]
}

module "zabbix_host" {
  source = "github.com/opshost/terraform-zabbix-host"
  host = "${var.project_name}-stage"
  name = "${var.hostname_stage}"
  ip = "${google_compute_address.stage.address}"
  groups = [ "opshost", "opshost_sla_zero", "opshost_${var.partner_name}", "${zabbix_host_group.project.name}"]
  templates = ["opshost_drupal"]
}
```
