require 'elasticsearch'
require 'json'

require 'dyes/version'
require 'dyes/index'
require 'dyes/document'
require 'dyes/callbacks'
require 'dyes/store'

module Dyes
  def self.client(opts = {})
    @client ||= Elasticsearch::Client.new(opts)
  end
end
