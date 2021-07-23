const esbuild = require("esbuild");

const env = process.env.NODE_ENV || "production";

// FIXME: is a loop inefficient? entrypoints is an array after all.
for (let f of ["page/entry"]) {
  esbuild
    .build({
      entryPoints: [`src/app/scripts/${f}.ts`],
      tsconfig: "tsconfig-dist.json", // tsconfig.json has test related stuff for VSCode (can't be changed)
      bundle: true,
      sourcemap: env === "development",
      target: "firefox68",
      outfile: `dist/scripts/${f}.js`,
    })
    .catch(() => process.exit(1));
}
