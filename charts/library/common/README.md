

# common

Common library chart providing reusable Helm templates and default configurations.
Standardizes Kubernetes resource deployment (Deployments, Services, Ingress, ServiceMonitor)
across the chart repository with consistent security, observability, and best practices.

Used by all application charts in this repository for consistency.

---

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)  ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square) 

## Requirements

- Helm: v3+

## Values

<h3>Containers configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>containers</td>
			<td>object</td>
			<td><pre lang="">
The chart will always construct the main container.
</pre>
</td>
			<td>Containers configuration. Additional containers can be added under the 'containers' key.</td>
		</tr>
		<tr>
			<td>containers.main.args</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Command-line arguments passed to the container entrypoint. Use this to override or extend the container's startup command</td>
		</tr>
		<tr>
			<td>containers.main.env</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Environment variables injected into containers. Can reference ConfigMaps or Secrets via valueFrom</td>
		</tr>
		<tr>
			<td>containers.main.image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "Always",
  "repository": "traefik/whoami",
  "tag": "latest"
}
</pre>
</td>
			<td>Container image configuration including repository, tag, and pull policy</td>
		</tr>
		<tr>
			<td>containers.main.imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>List of imagePullSecrets for private container registries. Reference pre-created Secrets in the same namespace</td>
		</tr>
		<tr>
			<td>containers.main.probes.liveness</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
    "port": "main",
    "scheme": "HTTP"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "successThreshold": 1,
  "timeoutSeconds": 5
}
</pre>
</td>
			<td>Liveness probe configuration</td>
		</tr>
		<tr>
			<td>containers.main.probes.readiness</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
    "port": "main",
    "scheme": "HTTP"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "successThreshold": 1,
  "timeoutSeconds": 5
}
</pre>
</td>
			<td>Readiness probe configuration</td>
		</tr>
		<tr>
			<td>containers.main.probes.startup</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
    "port": "main",
    "scheme": "HTTP"
  },
  "initialDelaySeconds": 60,
  "periodSeconds": 10,
  "successThreshold": 1,
  "timeoutSeconds": 5
}
</pre>
</td>
			<td>Startup probe configuration</td>
		</tr>
		<tr>
			<td>containers.main.resources</td>
			<td>object</td>
			<td><pre lang="json">
{
  "limits": {
    "cpu": 2,
    "memory": "2Gi"
  },
  "requests": {
    "cpu": "1m",
    "memory": "32Mi"
  }
}
</pre>
</td>
			<td>CPU and memory resource allocation for the container</td>
		</tr>
	</tbody>
</table>
<h3>Global settings</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Fully override the chart name for Kubernetes resource names. Useful when deploying multiple instances with the same chart</td>
		</tr>
		<tr>
			<td>nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Override the Helm-generated release name. Lower priority than fullnameOverride</td>
		</tr>
		<tr>
			<td>namespaceOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Override the namespace where resources are deployed. Leave empty to use the release namespace</td>
		</tr>
		<tr>
			<td>podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true,
  "runAsNonRoot": true,
  "runAsUser": 65534,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</td>
			<td>Security context settings applied at the pod level for enhanced security</td>
		</tr>
		<tr>
			<td>replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Number of desired pods (replicas) for the deployment. Modify to scale the application horizontally</td>
		</tr>
		<tr>
			<td>revisionHistoryLimit</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Number of revisions to keep for rollback purposes. Set to 3 for balanced history management</td>
		</tr>
		<tr>
			<td>strategyType</td>
			<td>string</td>
			<td><pre lang="json">
"Recreate"
</pre>
</td>
			<td>Deployment update strategy configuration</td>
		</tr>
	</tbody>
</table>
<h3>Ingress configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>ingress</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "enabled": false,
    "hosts": [
      {
        "host": "chart-example.local",
        "paths": [
          {
            "path": "/",
            "pathType": "Prefix"
          },
          {
            "path": "/testpath",
            "pathType": "Prefix"
          }
        ]
      }
    ]
  }
}
</pre>
</td>
			<td>Ingress configuration. Additional ingress resources can be added under the 'ingress' key.</td>
		</tr>
	</tbody>
</table>
<h3>Monitoring configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>serviceMonitor</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "endpoints": [
    {
      "metricRelabelings": [
        {
          "action": "replace",
          "regex": "olstring_(.*)",
          "replacement": "newstring_$1",
          "sourceLabels": [
            "__name__"
          ],
          "targetLabel": "__name__"
        }
      ],
      "port": "main"
    }
  ],
  "labels": {
    "release": "prometheus"
  }
}
</pre>
</td>
			<td>Monitoring configuration. Additional monitoring resources can be added under the 'serviceMonitor' key.</td>
		</tr>
	</tbody>
</table>
<h3>Services configuration</h3>
<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>services</td>
			<td>object</td>
			<td><pre lang="json">
{
  "main": {
    "annotations": {},
    "enabled": true,
    "labels": {},
    "ports": {
      "main": {
        "port": 80,
        "protocol": "TCP"
      }
    },
    "type": "ClusterIP"
  }
}
</pre>
</td>
			<td>Service configuration. Additional services can be added under the 'services' key.</td>
		</tr>
	</tbody>
</table>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| trowaflo | <trowa.flo@gmail.com> |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
