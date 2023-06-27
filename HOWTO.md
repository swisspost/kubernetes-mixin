_based on [Prometheus Monitoring Mixins](https://monitoring.mixins.dev/_#how-to-use-mixins)_

# How to create rules


* ```kubernetes-mixin$ jb install```
* Customising the mixin
  * ```mkdir -p post/files/dashboards``` and change directory 'post'
  * create file [mixin.libsonnet](./post/mixin.libsonnet)
* build alerts
  ```
  jsonnet -J ../vendor -S -e 'std.manifestYamlDoc((import "mixin.libsonnet").prometheusAlerts)' > files/alerts.yml
  ```
* build (recording) rules
  ```
  jsonnet -J ../vendor -S -e 'std.manifestYamlDoc((import "mixin.libsonnet").prometheusRules)' > files/rules.yml
  ```
* build dashboards
  ```
  jsonnet -J ../vendor -m files/dashboards -e '(import "mixin.libsonnet").grafanaDashboards'
  ```

# Apply to Victoria Metrics

* Copy the recording rules file to... [k8s-recording-rules.yaml](https://gitit.post.ch/projects/MST/repos/manage-vm-alerts-int/commits/b77edc66e4172f5aecdca43637dba8c7153d31c8)
* Copy the alert rules file to... [k8s-alerting-rules.yaml](https://gitit.post.ch/projects/MST/repos/manage-vm-alerts-int/commits/839096cd3345146ac5037b17d2a234d1e43a3dd7)
