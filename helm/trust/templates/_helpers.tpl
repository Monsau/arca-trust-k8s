{{- define "trust.fullname" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "trust.labels" -}}
app.kubernetes.io/name: {{ include "trust.fullname" . }}
app.kubernetes.io/part-of: arca-suite
app.kubernetes.io/managed-by: helm
{{- end -}}

{{- define "trust.selectorLabels" -}}
app.kubernetes.io/name: {{ include "trust.fullname" . }}
{{- end -}}

{{- define "trust.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "trust.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}
