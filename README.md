To run it locally use:

```
docker-compose up -d
```

After first deploy run in container:

```
sentry upgrade
sentry createuser --email=<email> --no-input --no-password --superuser
```

Make sure you have following variables set to correct value

```
BASE_URL=http://logger.at.your.domain
```
