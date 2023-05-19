echo "Running pub get in all packages"
for dir in packages/*; do
  if [ -d "$dir" ]; then
    echo "Running pub get in $dir"
    (cd "$dir" && flutter pub get)
  fi
done