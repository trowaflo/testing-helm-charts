{{- define "common.loader" -}}

  {{/* Merge values from chart and common chart */}}
  {{- include "common.values.prepare" . -}}

  {{/* Render service */}}
  {{- include "common.manifests.service" . | nindent 0 -}}

  {{/* Render ingress */}}
  {{- include "common.manifests.ingress" . | nindent 0 -}}

  {{/* Render deployment */}}
  {{- include "common.manifests.deployment" . | nindent 0 -}}

  {{/* Render service-monitor */}}
  {{- include "common.manifests.serviceMonitor" . | nindent 0 -}}

{{- end -}}
