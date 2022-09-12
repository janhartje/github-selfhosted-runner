# github-selfhosted-runner

This is a self hosted github action runner based on a Container

# Demo Deployment in Kubernetes

# Deployment

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: github-runner
  labels:
    app: github-runner
spec:
  replicas: 1
  selector:
    matchLabels:
      app: github-runner
  template:
    metadata:
      labels:
        app: github-runner
    spec:
      containers:
        - name: github-runner
          image: ghcr.io/janhartje/github-selfhosted-runner:latest
          env:
            - name: GITHUB_RUNNER_URL
              value: ''
            - name: RUNNER_TOKEN
              valueFrom:
                secretKeyRef:
                  name: git-hub-runner-secrets
                  key: runner_token
          resources:
            limits:
              memory: 500Mi
              cpu: 100m
            requests:
              memory: 500Mi
              cpu: 100m


```

# Secret

```
apiVersion: v1
kind: Secret
metadata:
  name: git-hub-runner-secrets
type: Opaque
data:
  runner_token: <Token>

```
