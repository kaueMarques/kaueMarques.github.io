#!/bin/bash

if [ "$#" -ne 4 ]; then
  echo "Uso: $0 <path> <title> <date> <tags>"
  exit 1
fi

path="$1"
title="$2"
date="$3"
tags="$4"

sanitized_title=$(echo "${title}" | tr -cd '[:alnum:]-' | tr ' ' '-')
filename="${path}/${date}-${sanitized_title}.md"

if [ -f "$filename" ]; then
  rm "$filename"
fi

header_elements=(
  "---"
  "title: '${title}'"
  "date: ${date}"
  "permalink: /posts/${date:0:4}/${date:5:2}/${sanitized_title}/"
  "tags:"
)

{
  for element in "${header_elements[@]}"; do
    echo "$element"
  done
  for tag in ${tags//,/ }; do
    echo "  - ${tag}"
  done
  echo "---"
} > "$filename"
