#!/bin/bash
cd ..
# Get the output of `melos list -l`
melos_output=$(melos list -l)

# Parse the output and update the README.md file
echo "$melos_output" | awk -F '->' '{print $1,$2}' | while read -r package version; do
    package=$(echo $package | xargs)  
echo $package
version=$(echo $version | awk '{print $1}')  # Trim whitespace
sed -i.bak -E "s|($package.*)(v[0-9\.+\-]+)|\1v$version|g" README.md
done

# Remove the backup file
rm README.md.bak