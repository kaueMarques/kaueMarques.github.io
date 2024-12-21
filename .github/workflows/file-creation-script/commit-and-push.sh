#!/bin/bash
set -e

git add _posts/
git commit -m "feat: post feito por gh-action, issue #$1, titulo $2"
git push
