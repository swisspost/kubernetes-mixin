
local kubernetes = import "../mixin.libsonnet";

kubernetes {
  _config+:: {
    kubeStateMetricsSelector: 'job="kube-state-metrics"',
    cadvisorSelector: 'job="kubernetes-nodes-cadvisor"',
    nodeExporterSelector: 'job="prometheus-node-exporter"',
    kubeApiserverSelector: 'job="kubernetes-apiservers"',
    kubeletSelector: 'job="kubernetes-nodes"',
    kubeControllerManagerSelector: 'job="kubernetes-nodes"',
    showMultiCluster: true,
    vmTenant: '0',
    grafanaK8s+:: {
      dashboardNamePrefix: 'mixin / ',
      dashboardTags: ['kubernetes', 'infrastucture'],
    },
  },
}
