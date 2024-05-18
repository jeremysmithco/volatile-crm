const esbuild = require('esbuild')
const path = require('path')
const rails = require('esbuild-rails')

const config = {
  entryPoints: ["application.js"],
  bundle: true,
  outdir: path.join(process.cwd(), "app/assets/builds"),
  absWorkingDir: path.join(process.cwd(), "app/javascript"),
  minify: true,
  plugins: [rails()],
}

async function watch() {
  let context = await esbuild.context({...config, logLevel: 'info'})
  context.watch()
}

if (process.argv.includes("--watch")) {
  watch()
} else {
  esbuild.build(config)
}
