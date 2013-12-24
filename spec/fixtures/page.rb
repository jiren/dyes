class Page
  include Dyes::Document

  dyes index: :domain_index

  attr_accessor :attributes, :domain

  def initialize(attributes = {})
    @attributes = attributes
    @attributes['id'] = self.id
  end

  def id
    @id ||= Time.now.to_f.to_s.sub('.', '')
  end

  def domain_index  
    self.domain.dyes_index
  end

  def self.create(attributes)
    page = self.new(attributes)
    page.save
  end

  def save
    dyes_save(self.attributes)
    self
  end

  def destroy
    dyes_destroy
    self
  end

end
