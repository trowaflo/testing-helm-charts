{{- define "frigateExporter.env" -}}
env:
  - name: "FRIGATE_STATS_URL"
    value: http://{{ include "common.helpers.fullname" . }}.{{ include "common.helpers.namespace" . }}.svc.cluster.local:5000/api/stats
{{- end -}}
