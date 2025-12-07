{{- define "common.manifests.ingress" -}}
{{- if include "common.helpers.hasEnabled" .Values.ingress -}}
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ include "common.helpers.fullname" . }}
  namespace: {{ include "common.helpers.namespace" . }}
  labels:
    test: {{include "common.helpers.hasEnabled" .Values.ingress}}
    {{- include "common.helpers.labels" . | nindent 4 }}
  {{- with .Values.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  ingressClassName: {{ .Values.ingress.className | default "traefik" | quote }}
  rules:
  {{- range $serviceName, $cfg := .Values.ingress }}
    {{- if $cfg.enabled }}
      {{- range $host := $cfg.hosts }}
    - host: {{ $host.host }}
      http:
        paths:
        {{- range $path := $host.paths }}
          - path: {{ $path.path }}
            pathType: {{ $path.pathType | default "Prefix" }}
            backend:
              service:
                name: {{ include "common.helpers.fullname" $ }}-{{ $serviceName }}
                port:
                  name: {{ $serviceName }}
        {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
...
{{- end }}
{{- end -}}
