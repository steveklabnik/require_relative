require 'rubygems'
require 'bundler'
require 'minitest/autorun'

require 'require_relative'

class RequireRelativeTest < MiniTest::Unit::TestCase

  def test_current_dir_not_in_load_path
    assert_nil $:.detect{|i| i == "."}
  end

  def test_require_relative
    assert require_relative('test/foo')
  end

  def test_require_relative_subdir
    assert require_relative('test/subdir/bar')
  end
end

