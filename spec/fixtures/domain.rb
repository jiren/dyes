module DummyOrm
  def save
    dyes_create_index
    self
  end

  def destroy
    dyes_delete_index
    self
  end

  def id
    @id ||= Time.now.to_f.to_s.sub('.', '')
  end

end

class Domain
  include Dyes::Index
  include DummyOrm
end

class DomainWithMapping
  include Dyes::Index
  include DummyOrm

  def dyes_mapping
    properties = {
      'id' =>   { 'type' => 'string', 'analyzer' => 'keyword',  'include_in_all' => false },
      'name' => { 'type' => 'string', 'analyzer' => 'snowball', 'boost' => 5.0 }
    }

    { mappings: {Page.dyes_doc_type => {'properties' => properties} }}
  end

end

