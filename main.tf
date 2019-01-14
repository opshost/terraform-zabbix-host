resource "zabbix_host" "default" {
  host = "${var.host}"
  name = "${var.name}"
  monitored = "${var.monitored}"
  interfaces = [{
    ip = "${var.ip}"
    main = "true"
    port = "${var.port}"
    type = "${var.type}"
  }]
  groups = "${var.groups}"
  templates = "${var.templates}"
}
