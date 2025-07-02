{{- define "helm-log-analyzer.name" -}}
helm-log-analyzer
{{- end }}

{{- define "helm-log-analyzer.fullname" -}}
{{ .Release.Name }}-{{ include "helm-log-analyzer.name" . }}
{{- end }}
