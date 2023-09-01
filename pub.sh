for d in packages/* ; do
  if [ -d "$d" ]; then
    echo "Running flutter analyze inside $d"
    cd $d
    flutter analyze
    cd ../..
  fi
done