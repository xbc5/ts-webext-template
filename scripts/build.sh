#!/bin/bash
QUICK_BUILD=false

for arg in $@; do
    case "$arg" in
        --quick)
            QUICK_BUILD=true
            shift
            ;;
    esac
done

[[ $QUICK_BUILD == false ]] && { tsc --project tsconfig-dist.json --noEmit || exit $?; }

node scripts/esbuild.js \
    && cp --verbose src/manifest.json dist/ \
    && cp --verbose -a src/assets/ src/html dist/ \
    && scripts/build-sass.sh \

touch watch  # trigger `web-ext --watch-file watch` (cannot be hidden file)