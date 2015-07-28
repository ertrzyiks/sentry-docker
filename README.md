To run it locally use:

```
docker-compose up -d
```

After first deploy run in container:

```
sentry upgrade --no-input
sentry createuser --email=<email> --no-input --no-password --superuser
```

Make sure you have following variables set to correct value

```
BASE_URL=http://logger.at.your.domain
```


Using 7.6 cause migration fail:

```
 > sentry:0161_auto__chg_field_authprovider_config
FATAL ERROR - The following SQL query failed: ALTER TABLE "sentry_authprovider" ALTER COLUMN "config" TYPE jsonb, ALTER COLUMN "config" DROP NOT NULL, ALTER COLUMN "config" DROP DEFAULT;
The error was: column "config" cannot be cast automatically to type jsonb
HINT:  Specify a USING expression to perform the conversion.
```
