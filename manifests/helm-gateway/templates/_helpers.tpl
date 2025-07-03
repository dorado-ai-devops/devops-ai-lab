{{- define "helm-gateway.name" -}}
ai-gateway
{{- end }}

{{- define "helm-gateway.fullname" -}}
{{ .Release.Name }}-{{ include "helm-gateway.name" . }}
{{- end }}
