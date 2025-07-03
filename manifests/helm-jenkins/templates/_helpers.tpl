{{- define "helm-jenkins.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "helm-jenkins.fullname" -}}
{{ .Release.Name }}
{{- end }}
