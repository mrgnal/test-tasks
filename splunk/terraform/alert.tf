resource "signalfx_detector" "image_error" {
  name = "Pod failed alert"
  description = "Alert when any Kubernetes pod goes into Failed phase"

  program_text = <<-EOF
      signal = data("k8s.pod.phase", filter("k8s.pod.phase", "Failed"))
      detect(when(signal>0)).publish('${var.alert_name}')
    EOF

    rule {
      severity = "Critical"
      detect_label = var.alert_name
      description   = "Pod failed:)"
    }
}