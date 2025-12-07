

# graphite-exporter

Prometheus exporter for converting Graphite plaintext protocol metrics to Prometheus format.
Enables Prometheus to scrape metrics from legacy Graphite systems and sources
(e.g., TrueNAS, custom monitoring systems) that emit Graphite-formatted metrics.

---

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square)  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) 

**Homepage:** <https://github.com/prometheus/graphite_exporter>

## Source Code

* <https://github.com/prometheus/graphite_exporter>
* <https://github.com/trowaflo/helm-charts>

## Requirements

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://trowaflo.github.io/helm-charts | common | 0.1.0 |

- Helm: v3+

## Getting Started

### Add repository

```bash
helm repo add graphite-exporter https://example.com/helm-charts
helm repo update
```

### Install

```bash
helm install my-graphite-exporter graphite-exporter/graphite-exporter \
  --namespace graphite-exporter \
  --create-namespace
```

### Upgrade

```bash
helm upgrade my-graphite-exporter graphite-exporter/graphite-exporter \
  --namespace graphite-exporter \
  --install
```

### Uninstall

```bash
helm uninstall my-graphite-exporter --namespace graphite-exporter
```

## Values

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>containers.main.args[0]</td>
			<td>string</td>
			<td><pre lang="json">
"--graphite.listen-address=:9109"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containers.main.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"IfNotPresent"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containers.main.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"prom/graphite-exporter"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containers.main.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"v0.16.0@sha256:e54bca6645ea8a9e8c52312a8540de98ad08819d38476c021d77a0eae75bc797"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/metrics"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/metrics"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>containers.main.probes.startup.httpGet.path</td>
			<td>string</td>
			<td><pre lang="json">
"/metrics"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.main.hosts[0].host</td>
			<td>string</td>
			<td><pre lang="json">
"graphite-exporter.fqdn.example.com"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.main.hosts[0].paths[0].path</td>
			<td>string</td>
			<td><pre lang="json">
"/"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.main.hosts[0].paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[0].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[0].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(scale_.*)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[0].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[10].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[10].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(cpu)_cpu([0-9]+)?"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[10].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}${3}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[10].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[10].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[11].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[11].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(total)_total"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[11].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[11].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[11].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[12].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[12].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(available)_available"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[12].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[12].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[12].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[13].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[13].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(size)_size"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[13].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[13].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[13].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[14].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[14].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(avail)_avail"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[14].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[14].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[14].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[15].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[15].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(free)_free"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[15].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[15].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[15].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[16].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[16].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(l2bytes)_l2bytes"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[16].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[16].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[16].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[17].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[17].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(l2hits)_l2hits"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[17].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[17].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[17].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[18].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[18].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(l2miss)_l2miss"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[18].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[18].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[18].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[19].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[19].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(load)_load(1|5|15)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[19].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}${3}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[19].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[19].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[1].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[1].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^scale_([^_]+)_.*"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[1].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[1].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[1].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"hostname"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[20].action</td>
			<td>string</td>
			<td><pre lang="json">
"keep"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[20].regex</td>
			<td>string</td>
			<td><pre lang="json">
"truenas_(system_uptime.*|cpu_usage.*|cputemp.*|system_load.*|meminfo.*|arcstats.*|net_.*(speed|received|sent).*|disk_stats_busy__serial_lunid.*)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[20].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[2].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[2].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^scale_[^_]+_([^_]+)_.*"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[2].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[2].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[2].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"service"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[3].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[3].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^.*_cpu_cpu([0-9]+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[3].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"cpu${1}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[3].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[3].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"cpu"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[4].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[4].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^.*_cputemp_temperatures_cpu([0-9]+)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[4].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"cpu${1}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[4].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[4].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"cpu"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[5].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[5].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^.*_net_speed_([^_]+)_[^_\\n]+"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[5].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[5].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[5].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"interface"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[6].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[6].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*_net_speed).*"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[6].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[6].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[6].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[7].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[7].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(scale_truenas)_truenas_(.*)$"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[7].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[7].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[7].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[8].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[8].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^scale_[^_]+_(.*)"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[8].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"truenas_${1}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[8].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[8].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[9].action</td>
			<td>string</td>
			<td><pre lang="json">
"replace"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[9].regex</td>
			<td>string</td>
			<td><pre lang="json">
"^(.*)_(uptime)_uptime"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[9].replacement</td>
			<td>string</td>
			<td><pre lang="json">
"${1}_${2}"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[9].sourceLabels[0]</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].metricRelabelings[9].targetLabel</td>
			<td>string</td>
			<td><pre lang="json">
"__name__"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceMonitor.endpoints[0].port</td>
			<td>string</td>
			<td><pre lang="json">
"main"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.ports.graphite-tcp.port</td>
			<td>int</td>
			<td><pre lang="json">
9109
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.ports.graphite-tcp.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.ports.graphite-udp.port</td>
			<td>int</td>
			<td><pre lang="json">
9109
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.ports.graphite-udp.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"UDP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.graphite.type</td>
			<td>string</td>
			<td><pre lang="json">
"LoadBalancer"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.main.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.main.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.main.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.main.ports.main.port</td>
			<td>int</td>
			<td><pre lang="json">
9108
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>services.main.ports.main.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
	</tbody>
</table>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
