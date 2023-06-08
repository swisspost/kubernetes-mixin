
local kubernetes = import "../mixin.libsonnet";

kubernetes {
  _config+:: {
    kubeStateMetricsSelector: 'job="kube-state-metrics"',
    cadvisorSelector: 'job="kubelet"',
    nodeExporterSelector: 'job="node-exporter"',
    kubeletSelector: 'job="kubelet"',
    vmTenant: '0',
    grafanaK8s+:: {
      dashboardNamePrefix: 'mixin / ',
      dashboardTags: ['kubernetes', 'infrastucture'],
    },
  },
}
