# run 

```bash
git clone git@github.com:waxz/CF_Web_Proxy.git /tmp/CF_Web_Proxy

npm install wrangler --save-dev -C /tmp/CF_Web_Proxy

npx -C /tmp/CF_Web_Proxy wrangler pages dev  . --port 8888 --ip 0.0.0.0

# npx wrangler pages dev --local-protocol=https . --port 8888 --ip 0.0.0.0

# deploy to cloudflare
npx -C /tmp/CF_Web_Proxy wrangler pages deploy

```

# use d1

https://blog.cloudflare.com/making-static-sites-dynamic-with-cloudflare-d1/ 
add permission https://dash.cloudflare.com/profile/api-tokens, account -> d1 -> edit

```bash
export CLOUDFLARE_API_TOKEN=xxxxx 
npx wrangler d1 create d1-example

npx  wrangler d1 execute d1-example --file src/create.sql
# upload to Pages
npx  wrangler d1 execute d1-example --remote  --file src/clean.sql
npx  wrangler d1 execute d1-example --remote  --file src/create.sql
```
