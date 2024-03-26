# Deployed containers

Two containers are deployed by [azAcrBuild.sh](../infra/azAcrBuild.sh).

## nginx

This container is a simple NGINX configuration that comes from The OpenTelemetry blog [Learn how to instrument NGINX with OpenTelemetry](https://opentelemetry.io/blog/2022/instrument-nginx/).

## otel-collector

This container uses the `opentelemetry-collector-contrib` image because it contains the [`azuremonitor` exporter](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/exporter/azuremonitorexporter) to export logs to Azure Monitor.