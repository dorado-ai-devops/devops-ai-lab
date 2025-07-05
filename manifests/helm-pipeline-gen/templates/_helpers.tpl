{{- define "helm-pipeline-gen.name" -}}
helm-pipeline-gen
{{- end }}

{{- define "helm-pipeline-gen.fullname" -}}
{{ .Release.Name }}-{{ include "helm-pipeline-gen.name" . }}
{{- end }}
