{{- define "common.manifests.service" -}}
{{- if include "common.helpers.hasEnabled" .Values.services -}}
{{- range $serviceName, $svcConfig := .Values.services }}
  {{- if $svcConfig.enabled }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "common.helpers.fullname" $ }}-{{ $serviceName }}
  namespace: {{ include "common.helpers.namespace" $ }}
  labels:
    {{- include "common.helpers.labels" $ | nindent 4 }}
    {{- with $svcConfig.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  {{- with $svcConfig.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  type: {{ $svcConfig.type | default "ClusterIP" }}
  ports:
  {{- range $portName, $portCfg := $svcConfig.ports }}
    - name: {{ $portName }}
      port: {{ $portCfg.port }}
      protocol: {{ include "common.helpers.protocol" $portCfg.protocol }}
      targetPort: {{ $portName }}
  {{- end }}
  selector:
    app.kubernetes.io/name: {{ include "common.helpers.name" $ }}
    app.kubernetes.io/instance: {{ $.Release.Name }}
...
  {{- end }}
{{- end }}
{{- end }}
{{- end -}}
