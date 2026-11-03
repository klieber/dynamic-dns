# dynamic-dns

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/klieber/dynamic-dns?sort=semver)](https://github.com/klieber/dynamic-dns/releases)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/klieber/dynamic-dns)](https://hub.docker.com/r/klieber/dynamic-dns/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/klieber/dynamic-dns)](https://hub.docker.com/r/klieber/dynamic-dns)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/klieber/dynamic-dns/latest)](https://hub.docker.com/r/klieber/dynamic-dns/tags)

A lightweight containerized Dynamic DNS client for Cloudflare. It discovers your external public IPv4 address and updates matching Cloudflare DNS `A` records across your zones automatically.

## Usage

```bash
docker run -d \
  --name dynamic-dns \
  --restart unless-stopped \
  -e CF_AUTH_TOKEN="your-cloudflare-api-token" \
  -e CF_DOMAINS="home.kylelieber.com,ha.kylelieber.com" \
  ghcr.io/klieber/dynamic-dns:latest
```

## Environment Variables

| Variable | Description | Required | Default |
| :--- | :--- | :--- | :--- |
| `CF_AUTH_TOKEN` | Cloudflare API Bearer token with permissions to read zones and edit DNS records. | **Yes** | |
| `CF_DOMAINS` | Comma-separated list of fully-qualified domain names to keep updated. | **Yes** | |
| `CF_UPDATE_INTERVAL` | Interval between DNS update checks (in seconds). | No | `3600` |
| `CF_PROXIED` | Explicitly override Cloudflare proxy status (`true` or `false`). If omitted, existing proxy status on each record is preserved. | No | *(preserves existing)* |
| `CF_FORCE_UPDATE` | Force DNS update call even if the current IP already matches (`true` or `false`). | No | `false` |

### Cloudflare API Token Permissions

Create an API token in the [Cloudflare Dashboard](https://dash.cloudflare.com/profile/api-tokens) with the following permissions:
- **Zone** - **Zone** - **Read**
- **Zone** - **DNS** - **Edit**
- Zone Resources: **All zones** (or include specific zones)
