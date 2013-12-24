$:.unshift(File.dirname(__FILE__))
require 'spec_helper'

describe Dyes::Index do

  let(:client) { Dyes.client}

  it 'has valid index name' do
    domain = Domain.new

    expect(domain.dyes_index).to eq "domain_#{domain.id}"
  end

  describe "#create" do
    after(:each) do
      Dyes.client.indices.delete(index: @domain.dyes_index) if @domain
    end

    it 'create index with empty mapping' do
      @domain = Domain.new.save

      expect(Dyes.client.indices.exists(index: @domain.dyes_index)).to be_true
    end

    it 'create index with mapping' do
      @domain = DomainWithMapping.new.save

      expect(Dyes.client.indices.exists(index: @domain.dyes_index)).to be_true
      mapping = Dyes.client.indices.get_mapping index: @domain.dyes_index

      expect(mapping[@domain.dyes_index]).to eq @domain.dyes_mapping[:mappings]
    end
  end

  describe "#destroy" do
    it 'destroy index' do
      @domain = Domain.new.save
      expect(Dyes.client.indices.exists(index: @domain.dyes_index)).to be_true

      @domain.destroy
      expect(Dyes.client.indices.exists(index: @domain.dyes_index)).to be_false
    end
  end

end
