#!/bin/bash
hexo clean
hexo generate
if test -d public/posts_backup
then
    rm -rf public/posts_backup
fi
cp -r source/ public/posts_backup
cp themes/next/_config.yml public/posts_backup/_config.yml.next
hexo deploy
