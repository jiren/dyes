$:.unshift(File.dirname(__FILE__))
require 'spec_helper'

describe Dyes do

  it 'initalize elasticsearch client' do
    Dyes.client(host: 'localhost:9200')

    expect(Dyes.client).to_not be_nil
  end

end

