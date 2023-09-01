for d in packages/* ; do
  test_dir="$d/test"
  if [ -d "$test_dir" ]; then
    echo "Running flutter test inside $d"
    cd $d
    flutter test
    cd ../..
  fi
done
