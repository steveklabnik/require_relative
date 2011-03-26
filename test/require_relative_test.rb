require 'rubygems'
require 'bundler'
require 'minitest/autorun'

require 'require_relative'

class RequireRelativeTest < MiniTest::Unit::TestCase
  # after each test we reset Ruby's internal list of required files, so that we
  # can rerequire the ones we're testing with
  def setup
    @req_length = $".length
  end

  def teardown
    $".pop($".length - @req_length)
  end

  def test_require_relative
    assert require_relative('foo')
  end

  def test_require_relative_subdir
    assert require_relative('subdir/bar')
  end
end

