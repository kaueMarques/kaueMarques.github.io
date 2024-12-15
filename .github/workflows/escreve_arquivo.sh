#!/bin/bash

TITULO=$1
CORPO=$2
DATA=$3
TITULO_FORMATADO=$(echo "$TITULO" | tr ' ' '-')
FILENAME="_pages/${DATA}-${TITULO_FORMATADO}.md"

mkdir -p _pages

cat <<EOF > "$FILENAME"
---
title: '$TITULO'
date: $DATA
permalink: /posts/${DATA:0:4}/${DATA:5:2}/${TITULO_FORMATADO}/
tags:
  - nao-definido
---

$CORPO
EOF