for d in packages/* ; do
  if [ -d "$d" ]; then
    echo "Running flutter analyze inside $d"
    cd "$d"
    flutter analyze

    example_dir="$d/example"
    if [ -d "$example_dir" ]; then
      echo "Running flutter analyze inside $example_dir"
      cd "$example_dir"
      flutter analyze
      cd ..
    fi

    cd ../..
  fi
done
