{{- define "common.values.prepare" -}}

{{- $commonValues := mustDeepCopy .Values.common -}}
{{- $chartValues := mustDeepCopy (omit .Values "common") -}}
{{- $mergedValues := mustMergeOverwrite $commonValues $chartValues -}}
{{- $_ := set . "Values" (mustDeepCopy $mergedValues) -}}

{{- end -}}
