require_relative
================

In Ruby 1.9.2, "." was removed from the $LOAD_PATH. require_relative was
added to let you require files relative to your current directory.

This gem backports both of these features to earlier Rubies.

## Usage

    require 'rubygems'
    require 'require_relative'

    require 'foo' #=> LoadError
    require_relative 'foo' #=> works!
