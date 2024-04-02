{{/*
Expand the name of the chart.
*/}}
{{- define "todo-list.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "todo-list.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "todo-list.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "todo-list.labels.api" -}}
helm.sh/chart: {{ include "todo-list.chart" . }}
{{ include "todo-list.selectorLabels.api" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "todo-list.labels.ui" -}}
helm.sh/chart: {{ include "todo-list.chart" . }}
{{ include "todo-list.selectorLabels.ui" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "todo-list.selectorLabels.api" -}}
app.kubernetes.io/name: {{ include "todo-list.name" . }}-api
app.kubernetes.io/instance: {{ .Release.Name }}-api
{{- end }}

{{- define "todo-list.selectorLabels.ui" -}}
app.kubernetes.io/name: {{ include "todo-list.name" . }}-ui
app.kubernetes.io/instance: {{ .Release.Name }}-ui
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "todo-list.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "todo-list.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name for the env secret.
*/}}
{{- define "env-api.secretName" -}}
  {{ include "todo-list.fullname" . }}-api
{{- end -}}

