{
  _config+:: {
    kubeSchedulerSelector: 'job="kube-scheduler"',
  },

  prometheusAlerts+:: {
    groups+: [
      {
        name: 'kubernetes-system-scheduler',
        tenant: $._config.vmTenant,
        rules: [
          (import '../lib/absent_alert.libsonnet') {
            componentName:: 'KubeScheduler',
            selector:: $._config.kubeSchedulerSelector,
          },
        ],
      },
    ],
  },
}
