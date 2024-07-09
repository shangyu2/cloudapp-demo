{{- define "zookeeper.selectorLabels" -}}
app: zookeeper
{{- end }}
{{- define "kafka.selectorLabels" -}}
app: kafka
{{- end }}
{{- define "rabbit.selectorLabels" -}}
app: rabbit
{{- end }}
{{- define "xxljob.selectorLabels" -}}
app: xxl-job-admin
{{- end }}
{{- define "elasticsearch.selectorLabels" -}}
app: elasticsearch-master
{{- end }}
{{- define "kibana.selectorLabels" -}}
app: kibana
{{- end }}
{{- define "skywalkingoap.selectorLabels" -}}
app: skywalkingoap
{{- end }}
{{- define "oapui.selectorLabels" -}}
app: skywalking
component: ui
release: skywalking
{{- end }}
{{- define "nacos.selectorLabels" -}}
app: nacos
{{- end }}
{{- define "logstash.selectorLabels" -}}
app: logstash
{{- end }}
{{- define "nginx.selectorLabels" -}}
app: nginx
{{- end }}
{{/* hive-open-gateway labels */}}
