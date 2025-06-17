# KoboToolbox Helm Chart

This chart is intended for high availability instances of KoboToolbox. Small and casual instances should use [kobo-install](https://github.com/kobotoolbox/kobo-install).

# Design decisions

- As generic as possible, agnostic about the environment variables set for each service
- Supports high availability via k8s's horizontal pod autoscaler (HPA), pod disruption budget (PDB), and topology spread constraints
- Stick to defaults and conventions from `helm create` when possible
- Every deployment/job should do one thing. Migrate, run uwsgi, run celery, etc

# Usage

This Helm chart is published to GitHub Container Registry (ghcr.io).

1. **Log in to GitHub Container Registry:**
   ```bash
   echo "${{ secrets.GITHUB_TOKEN }}" | helm registry login ghcr.io --username ${{ github.actor }} --password-stdin
   ```
   (Replace `${{ secrets.GITHUB_TOKEN }}` and `${{ github.actor }}` with your GitHub token and username if running locally, or ensure your CI environment has these available.)

2. **Carefully review `values.yaml`.** Set image tag version, if desired. Set databases, secret keys, etc.

3. **Install the chart:**
   Replace `OWNER` with the GitHub repository owner (e.g., your GitHub username or organization name) and `CHART_VERSION` with the specific version you want to install.
   ```bash
   helm install your-kobo oci://ghcr.io/OWNER/kobo --version CHART_VERSION -f your-values.yaml
   ```

## Upgrading

1. **Log in to GitHub Container Registry (if not already logged in):**
   ```bash
   echo "${{ secrets.GITHUB_TOKEN }}" | helm registry login ghcr.io --username ${{ github.actor }} --password-stdin
   ```

2. **Upgrade the chart:**
   Replace `OWNER` with the GitHub repository owner and `CHART_VERSION` with the desired new version.
   ```bash
   helm upgrade your-kobo oci://ghcr.io/OWNER/kobo --version CHART_VERSION -f your-values.yaml
   ```

Tip: Consider using helm diff to preview changes first.

# Fork History & Acknowledgements

This Helm chart is a fork of [muhammad-levi/kobo-helm-chart](https://github.com/muhammad-levi/kobo-helm-chart), which itself is a fork of the original [kobotoolbox/kobo-helm-chart](https://github.com/kobotoolbox/kobo-helm-chart).

This chart also incorporates ideas and learnings from:
- https://gitlab.com/burke-software/django-helm-chart
- https://github.com/one-acre-fund/kobo-k8s/
- The UNICEF Helm chart for KoboToolbox
