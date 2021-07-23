scripts/clean.sh
scripts/build.sh  # npm-watch doesn't build until changes
npx npm-watch build:quick & 
scripts/start.sh