#!/bin/bash
# tsconfig-paths/register rewrites import paths to paths supported by Node
#  becuase ts-node does not support the TS paths config option.
# see: https://github.com/TypeStrong/ts-node/issues/138.
npx ts-node --require tsconfig-paths/register src/test/perf/${1}.ts
