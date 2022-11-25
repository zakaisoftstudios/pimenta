module Nxt
  module ElasticSearch
    class Filtering
      attr_reader :filters

      def initialize(filters:)
        @filters = filters
      end

      def text_search(fields: [])
        search = fields.reduce('') do |text, field|
          text << "#{filters[field].strip} " if filters[field].present?
          text
        end
        
        search.empty? ? '*' : search.strip
      end

      def text_fields(fields: [])
        fields.reduce([]) do |fields, field|
          fields << { field => :word_middle } if filters[field].present?
          fields
        end
      end

      def greater_than_filters(fields: [])
        fields.reduce({}) do |query, field|
          query[field] = { gte: filters[field] } if filters[field].present?
          query
        end
      end
      
      def lower_than_filters(fields: [])
        fields.reduce({}) do |query, field|
          query[field] = { lte: filters[field] } if filters[field].present?
          query
        end
      end

      def regex_filters(fields: [])
        fields.reduce({}) do |query, field|
          query[field] = /#{filters[field]}/ if filters[field].present?
          query
        end
      end

      def distance_filter(field:, origin:)
        if filters[field].present?
          { 
            location: { 
              near: { 
                lat: origin.latitude, 
                lon: origin.longitude  
              },
              within: "#{filters[field].to_i + 1}km" 
            }
        }
        else
          {}
        end
      end
    end
  end
end