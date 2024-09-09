# Ingest Prometheus Metrics into Dynatrace using Otel Collector # 

Run the following commands on your Kubernetes cluster: 
1. Create an API token with Ingest metrics permissions within Dynatrace tenant and replace the values of tenant and API Token: 
```js
   kubectl create secret generic dynatrace-otelcol-dt-api-credentials --from-literal=DT_ENDPOINT=https://<tenant>.live.dynatrace.com/ --from-literal=DT_API_TOKEN=dt0c01.T2JTCLQUKJN4FER4LHEUQSTG.XXXXYYYYZZZ
```
2. Download the cert Manager:
```js
  kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.yaml
```
3. Download Opentelemetry operator
```js
  kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml
```
4. Add the Otel Helm Charts:
```js
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
```
5. Provide the details of what to import within Dynatrace using the values-deployment.yaml
```js
  helm upgrade -i dynatrace-collector open-telemetry/opentelemetry-collector -f values-deployment.yaml
```
  
 
