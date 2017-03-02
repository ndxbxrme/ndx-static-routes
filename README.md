# ndx-static-routes 
### provides routes to serve client content for [ndx-framework](https://github.com/ndxbxrme/ndx-framework) apps
install with  
`npm install --save ndx-static-routes`  
## example
`src/server/app.coffee`  
```coffeescript
require ndx-server
.config
  database: 'db'
.use 'ndx-static-routes'
.start()
```
## environment variables
ndx-static-routes serves up different content depending on the `NODE_ENV` variable  
#### `NODE_ENV=production`
    - dist/app
    - public
    - dist/index.html
#### `NODE_ENV=dev` (or anything else)
    - build/client
    - public
    - build/client/index.html
    - bower
    