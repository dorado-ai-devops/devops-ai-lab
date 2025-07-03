{{- define "helm-linter.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "helm-linter.fullname" -}}
{{ .Release.Name }}
{{- end }}
