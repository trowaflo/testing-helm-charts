{{- define "common.helpers.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.helpers.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "common.helpers.namespace" -}}
{{- $namespace := default .Chart.Name .Values.namespaceOverride -}}
{{- if contains $namespace .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "common.helpers.labels" -}}
app.kubernetes.io/name: {{ include "common.helpers.name" . }}
helm.sh/chart: {{ include "common.helpers.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "common.helpers.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.helpers.imageTag" -}}
{{- if .image.tag -}}
{{ .image.tag }}
{{- else -}}
{{ .Chart.AppVersion }}
{{- end -}}
{{- end -}}

{{- define "common.helpers.resources" -}}
{{- $resources := .resources | default dict -}}
{{ $resources | toYaml }}
{{- end -}}

{{- define "common.helpers.protocol" -}}
{{- $protocol := . | upper -}}
{{- if not (has $protocol (list "TCP" "UDP" "SCTP")) -}}
{{- fail (printf "Invalid protocol: %s. Expected: TCP, UDP, or SCTP." $protocol) -}}
{{- end -}}
{{ $protocol }}
{{- end -}}

{{- define "common.helpers.hasEnabled" -}}
{{- $hasEnabled := false -}}
{{- range $name, $cfg := . -}}
  {{- if and (kindIs "map" $cfg) $cfg.enabled -}}
    {{- $hasEnabled = true -}}
  {{- end -}}
{{- end -}}
{{- if $hasEnabled -}}
true
{{- end -}}
{{- end -}}
