# run 

```bash
git clone git@github.com:waxz/CF_Web_Proxy.git /tmp/CF_Web_Proxy

npm install wrangler --save-dev -C /tmp/CF_Web_Proxy

npx -C /tmp/CF_Web_Proxy wrangler pages dev  . --port 8888 --ip 0.0.0.0

# npx wrangler pages dev --local-protocol=https . --port 8888 --ip 0.0.0.0
```