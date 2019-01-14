variable "host" {
  description = "Host name of the Zabbix host, usually same as VM instance name"
}
variable "name" {
  description = "Resolving DNS hostname of the Zabbix host, typically for web scenarios"
}
variable "ip" {
  description = "Public IP-address of the Zabbix host, for connecting to Zabbix agent and for simple checks"
}
variable "monitored" {
  default = "true"
  description = "Is the Zabbix host enabled"
}
variable "port" {
  default = "10050"
  description = "Interface TCP port number of the Zabbix host, typially for Zabbix Agent"
}
variable "type" {
  default = "agent"
  description = "Interface type of the Zabbix host"
}
variable "groups" {
  type = "list"
  description = "List of host groups of the Zabbix host"
}
variable "templates" {
  type = "list"
  description = "List of Zabbix templates to link to the host"
}
