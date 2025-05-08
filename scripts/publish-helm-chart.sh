#!/bin/bash
helm package -d packages . && \
helm repo index . --url https://muhammad-levi.github.io/kobo-helm-chart
