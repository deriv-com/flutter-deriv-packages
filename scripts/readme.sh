# This script is used to update version numbers in the README.md file. 
# It is used in our version.yaml file (version github action).
cd ..

# Get the output of `melos list -l`
melos_output=$(melos list -l)

# This gets the package name and version number from the output of `melos list -l`
function parse_melos_output() {
    local melos_output="$1"
    echo "$melos_output" | awk -F '->' '{print $1,$2}'
}

# Replace current version with the new version in the README.md file.
# Looks for package name and version number in the README.md file and replaces it with the new version number.
parse_melos_output "$melos_output" | while read -r package version; do
    package=$(echo $package | xargs)  
    version=$(echo $version | awk '{print $1}')
    sed -i '' -E "s|($package.*)(v[0-9\.+\-]+)|\1v$version|g" README.md
done
