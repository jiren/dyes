require 'rubygems'
require 'bundler/setup'
require 'open-uri'

=begin
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'coveralls'

Coveralls.wear!
=end

RSpec.configure do |config|
  config.color_enabled = true
  #config.tty = true
  #config.formatter = :documentation
end

$:.unshift(File.dirname(__FILE__) + '/../lib/')
require 'dyes'

Dir[File.dirname(__FILE__) + '/fixtures/*'].each{|f| require f}
