{{- define "common.manifests.deployment" -}}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "common.helpers.fullname" . }}
  namespace: {{ include "common.helpers.namespace" . }}
  labels:
    {{- include "common.helpers.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  revisionHistoryLimit: {{ .Values.revisionHistoryLimit }}
  strategy:
    type: {{ .Values.strategyType }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ include "common.helpers.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{ include "common.helpers.name" . }}
        app.kubernetes.io/instance: {{ .Release.Name }}
      annotations:
      {{- if .Values.podAnnotations }}
        {{- range $key, $value := .Values.podAnnotations }}
        {{ $key }}: {{ $value | quote }}
        {{- end }}
      {{- end }}
    spec:
      automountServiceAccountToken: false
    {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
    {{- end }}
    {{- if .Values.securityContext }}
      securityContext:
        {{- toYaml .Values.securityContext | nindent 8 }}
    {{- end }}
      containers:
      {{- range $name, $container := .Values.containers }}
        - name: {{ $name }}
          image: "{{ $container.image.repository }}:{{ include "common.helpers.imageTag" $container }}"
          imagePullPolicy: {{ $container.image.pullPolicy }}
          ports:
          {{- range $serviceName, $svcConfig := $.Values.services }}
            {{- if $svcConfig.enabled }}
              {{- range $portName, $portCfg := $svcConfig.ports }}
            - name: {{ $portName }}
              containerPort: {{ $portCfg.port }}
              protocol: {{ include "common.helpers.protocol" $portCfg.protocol }}
              {{- end }}
            {{- end }}
          {{- end }}
          {{- if and $container.probes.enabled $container.probes.liveness.enabled }}
          livenessProbe:
            httpGet:
              path: {{ $container.probes.liveness.httpGet.path }}
              port: {{ $container.probes.liveness.httpGet.port }}
              scheme: {{ $container.probes.liveness.httpGet.scheme }}
            initialDelaySeconds: {{ $container.probes.liveness.initialDelaySeconds }}
            failureThreshold: {{ $container.probes.liveness.failureThreshold }}
            successThreshold: {{ $container.probes.liveness.successThreshold }}
            periodSeconds: {{ $container.probes.liveness.periodSeconds }}
            timeoutSeconds: {{ $container.probes.liveness.timeoutSeconds }}
          {{- end }}
          {{- if and $container.probes.enabled $container.probes.readiness.enabled }}
          readinessProbe:
            httpGet:
              path: {{ $container.probes.readiness.httpGet.path }}
              port: {{ $container.probes.readiness.httpGet.port }}
              scheme: {{ $container.probes.readiness.httpGet.scheme }}
            initialDelaySeconds: {{ $container.probes.readiness.initialDelaySeconds }}
            failureThreshold: {{ $container.probes.readiness.failureThreshold }}
            successThreshold: {{ $container.probes.readiness.successThreshold }}
            periodSeconds: {{ $container.probes.readiness.periodSeconds }}
            timeoutSeconds: {{ $container.probes.readiness.timeoutSeconds }}
          {{- end }}
          {{- if and $container.probes.enabled $container.probes.startup.enabled }}
          startupProbe:
            httpGet:
              path: {{ $container.probes.startup.httpGet.path }}
              port: {{ $container.probes.startup.httpGet.port }}
              scheme: {{ $container.probes.startup.httpGet.scheme }}
            initialDelaySeconds: {{ $container.probes.startup.initialDelaySeconds }}
            failureThreshold: {{ $container.probes.startup.failureThreshold }}
            successThreshold: {{ $container.probes.startup.successThreshold }}
            periodSeconds: {{ $container.probes.startup.periodSeconds }}
            timeoutSeconds: {{ $container.probes.startup.timeoutSeconds }}
          {{- end }}
          {{- if $container.args }}
          args:
            {{- toYaml $container.args | nindent 12 }}
          {{- end }}
          {{- if $container.env }}
          env:
            {{- toYaml $container.env | nindent 12 }}
          {{- end }}
          resources:
            {{- include "common.helpers.resources" $container | nindent 12 }}
        {{- if $.Values.podSecurityContext }}
          securityContext:
            {{- toYaml $.Values.podSecurityContext | nindent 12 }}
        {{- end }}
      {{- end }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
    {{- end }}
    {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
    {{- end }}
...
{{- end -}}
