$:.unshift(File.dirname(__FILE__))
require 'spec_helper'

describe Dyes::Document do

  let(:client) { Dyes.client}

  before(:each) do
    @domain = Domain.new.save
    @page = Page.new({'name' => 'Page1', 'url' => 'test.com'})
    @page.domain = @domain
  end

  after(:each) do
    @domain.destroy
  end

  it 'add document to index' do
    @page.save

    document = Dyes.client.get index: @domain.dyes_index, type: Page.dyes_doc_type, id: @page.id
    expect(@page.attributes).to eq document['_source']
  end

  it 'delete document from index' do
    @page.save

    document = Dyes.client.get index: @domain.dyes_index, type: Page.dyes_doc_type, id: @page.id
    expect(document['exists']).to be_true

    @page.destroy
    expect {
      Dyes.client.get index: @domain.dyes_index, type: Page.dyes_doc_type, id: @page.id
    }.to raise_error
  end

end
