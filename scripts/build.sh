#!/bin/sh
set -e
ROJO_CONFIG="dev.project.json"
DARKLUA_CONFIG=".darklua.json"
SOURCEMAP="darklua-sourcemap.json"
MODEL_ROJO_CONFIG="model.project.json"
LSP_SETTINGS=".luau-analyze.json"
# get if any of the arguments were "--serve"
build_dir="build"
is_wally=false

# if [ ! -d node_modules ]; then
#     sh scripts/npm-install.sh
# fi

for arg in "$@"
do
	if [ "$arg" = "--wally" ]; then
		echo "wally project detected"
		is_wally=true
	fi
done

to_wally_path() {
    dir_path="$1"
    find "$dir_path" -type f -print0 | while IFS= read -r -d '' file; do
        if grep -q "@pkg/@nightcycle" "$file"; then
            echo "removing @pkg/@nightcycle from $file"
            # Process the entire file, line by line
            sed -i 's|@pkg/@nightcycle|@wally|g' "$file"
        fi
    done
}


# create build directory
echo "clearing and making $build_dir"
rm -f $SOURCEMAP
rm -rf $build_dir
mkdir -p $build_dir

echo "copying contents to $build_dir"

cp -r "$ROJO_CONFIG" "$build_dir/$ROJO_CONFIG"
cp -r "$MODEL_ROJO_CONFIG" "$build_dir/$MODEL_ROJO_CONFIG"
cp -r "$DARKLUA_CONFIG" "$build_dir/$DARKLUA_CONFIG"
cp -r "default.project.json" "$build_dir/default.project.json"

if [ "$is_wally" = true ]; then
	cp -r "wally.toml" "$build_dir/wally.toml"
	cp -r "aftman.toml" "$build_dir/aftman.toml"
fi

# if stage-src exists, remove it
if [ -d "stage-src" ]; then
	rm -rf "stage-src"
fi

cp -r "src" "stage-src"

if [ "$is_wally" = true ]; then
	to_wally_path "stage-src"
fi

cp -r "stage-src" "$build_dir/src"
cp -r "stage-src" "$build_dir/stage-src"
if [ ! -d "Packages" ]; then
  mkdir "Packages"
fi
cp -rL "Packages" "$build_dir/Packages"
if [ ! -d "node_modules" ]; then
  mkdir "node_modules"
fi
cp -rL "node_modules" "$build_dir/node_modules"
cp -rL "scripts" "$build_dir/scripts"

cp -r "types" "$build_dir/types"
cp -r "lints" "$build_dir/lints"

cp -r "selene.toml" "$build_dir/selene.toml"
cp -r "stylua.toml" "$build_dir/stylua.toml"
cp -r "$LSP_SETTINGS" "$build_dir/$LSP_SETTINGS"

echo "build sourcemap"
rojo sourcemap "$MODEL_ROJO_CONFIG" -o "$SOURCEMAP"

# process files
echo "running stylua"
stylua "$build_dir/src"

# run darklua
echo "running build darklua"
rojo sourcemap "$build_dir/$ROJO_CONFIG" -o "$build_dir/$SOURCEMAP"
if [ "$is_wally" = true ]; then
	darklua process "stage-src" "$build_dir/src" --config "$DARKLUA_CONFIG" --verbose
fi

# final compile
echo "build rbxl"
if [ "$is_wally" = true ]; then
	cd "$build_dir"
	rojo build "$ROJO_CONFIG" -o "Package.rbxl"
	rm -rf "$build_dir/$MODEL_ROJO_CONFIG"
	rm -rf "$build_dir/$ROJO_CONFIG"
fi