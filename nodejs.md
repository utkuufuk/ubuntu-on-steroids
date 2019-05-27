# Node.js Tips
### Update Npm
 ```sh
 npm install npm@latest -g 
 npm rebuild
 ```

### Useful Commands
> For applicable commands below, add `-g` for *global* packages.

| Command               | Description                           |
|:----------------------|:--------------------------------------|
| `npm ls --depth=0`    | List installed packages               |
| `npm outdated`        | List outdated packages                |
| `npm dedupe`          | Reduce duplication in package tree    |
| `npm prune`           | Remove extraneous packages            |

### Configuring `package.json`
> See [docs](https://docs.npmjs.com/files/package.json) for detailed configuration options.

### TypeScript Integration
 1. `npm i -g typescript`
 2. `tsc --init`
 3. Edit `tsconfig.json`:
    * Change `target` to `es6`
    * Uncomment `outDir` and assign `./dist`
    * Uncomment `rootDir` and assign `./src`
    * Uncomment `"moduleResolution": "node"`
 4. `npm i -D typescript ts-node @types/node @types/express nodemon`
 5. Update `scripts` in `package.json`:
    ``` json
    ...
    ...
    "scripts": {
        "start": "node dist/app.js",
        "dev": "nodemon src/app.ts",
        "build": "tsc -p ."
    }
    ...
    ...

    ```
Use the following command to watch a file and automaticall compile on changes:
``` sh
tsc <filename>.ts -w
```

### ESLint Integration
 * `eslint --init` &mdash; create local ESLint configuration
 * `eslint --debug` &mdash; output debugging info
