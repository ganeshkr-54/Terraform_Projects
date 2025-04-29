git rev-list --objects --all | sort -k 2 | while read hash name; do
  size=$(git cat-file -s $hash)
  if [ $size -gt 100000000 ]; then
    echo "$size bytes : $name"
  fi
done

