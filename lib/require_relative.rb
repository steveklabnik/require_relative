# encoding: utf-8
# This is the source code for require_relative, a Ruby gem that backports that
# particular feature to Ruby 1.8.
#
# Please check out the [README](https://github.com/steveklabnik/require_relative/blob/master/README.md)
# for more information on how to build your own copy of the gem, as well as
# contribute fixes.

# require\_relative has no effect on Ruby 1.9 (or other versions that provide Kernel#require_relative
# out of the box)
unless Object.new.respond_to?(:require_relative, true)
  # Yep, you're looking at it! This gem is pretty small, and for good reason.
  # There's not much to do! We use split to find the filename that we're
  # looking to require, raise a LoadError if it's called in a context (like eval)
  # that it shouldn't be, and then require it via regular old require.
  #
  # Now, in 1.9, "." is totally removed from the $LOAD_PATH. We don't do that
  # here, because that would break a lot of other code! You're still vulnerable
  # to the security hole that caused this change to happen in the first place.
  # You will be able to use this gem to transition the code you write over to
  # the 1.9 syntax, though.
  def require_relative(relative_feature)

    file = caller.first.split(/:\d/,2).first

    raise LoadError, "require_relative is called in #{$1}" if /\A\((.*)\)/ =~ file

    require File.expand_path(relative_feature, File.dirname(file))
  end
end
