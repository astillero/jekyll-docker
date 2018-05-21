#!/usr/bin/env sh

if [ ! -f Gemfile ]; then
    >&2 echo "A Gemfile is required."
    exit 2
fi

bundle install

command=$(echo "$@" | awk '{print $1;}')
options=${@##$command}

case $command in
    'serve')
        command="serve $options --host 0.0.0.0"
        ;;
    *)
        command="$command $options"
esac

eval "jekyll $command"
