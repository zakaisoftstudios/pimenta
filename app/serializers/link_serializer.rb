require 'json_serializer'

class LinkSerializer < JsonSerializer	
	attribute :id
	attribute :text
	attribute :url	
	attribute :kind	
end
