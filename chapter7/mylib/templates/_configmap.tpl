{{- define "mylib.configmap.tpl" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "mylib.fullname" . }}
  labels:
    {{- include "mylib.labels" . | nindent 4 }}
data: {}
{{- end -}}
{{- define "mylib.configmap" -}}
{{- template "mylib.util.merge" (append . "mylib.configmap.tpl") -}}
{{- end -}}