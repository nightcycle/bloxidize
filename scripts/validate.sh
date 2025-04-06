#!/bin/sh
set -e

is_wally=false

for arg in "$@"
do
	if [ "$arg" = "--wally" ]; then
		echo "wally project detected"
		is_wally=true
	fi
done

sh scripts/download-types.sh
if [ "$is_wally" = true ]; then
	sh scripts/build.sh "$1" --wally
else
	sh scripts/build.sh "$1"
fi

cd "build"
luau-lsp analyze \
	--sourcemap="darklua-sourcemap.json" \
	--ignore="**/Packages/**" \
	--ignore="Packages/**" \
	--ignore="**/node_modules/**" \
	--ignore="node_modules/**" \
	--ignore="*.spec.luau" \
	--settings=".luau-analyze.json" \
	--definitions="types/globalTypes.d.lua" \
	"src"
selene src