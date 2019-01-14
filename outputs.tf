output "zabbix_host_id" {
  value = "${zabbix_host.default.host_id}"
}

output "zabbix_host_host" {
  value = "${zabbix_host.default.host}"
}

output "zabbix_host_name" {
  value = "${zabbix_host.default.name}"
}

output "zabbix_host_ip" {
  value = "${zabbix_host.default.interfaces.0.ip}"
}
