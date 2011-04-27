require "rubygems"
require "bundler"

Bundler.setup :default, :development

# Put test/unit back on the load path
test_unit = File.expand_path(File.join(File.dirname(__FILE__), '..', 'unit'))
$:.unshift test_unit unless $:.include? test_unit

# These require statments *must* be in this order:
# http://bit.ly/bCC0Ew
# Somewhat surprised they're not being required by Bundler...
require 'shoulda'
require 'mocha'

lib = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
$:.unshift lib unless $:.include? lib

require 'sprout'

test = File.expand_path(File.join(File.dirname(__FILE__), '..'))
$:.unshift test unless $:.include? test

require 'unit/fake_process_runner'
require 'unit/fake_executable_task'
require 'sprout/test_helper'

class Test::Unit::TestCase

  # Only clear registrations in the Sprout core
  # project - not in child projects
  def teardown
    Sprout::Executable.clear_entities!
    Sprout::Library.clear_entities!
    Sprout::Generator.clear_entities!
  end
end

