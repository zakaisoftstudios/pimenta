module StudentSearchable
  extend ActiveSupport::Concern

  included do
    searchkick(
      word_start: [:text_search],
      locations: [:location]
    )

    def search_data
      {
        text_search: text_search,
        age: age,
        grade_point_average: grade_point_average,
        gender: gender,
        mobility: mobility,
        location: { lat: latitude, lon: longitude },
        educational_levels: education_entries.pluck(:educational_level),
        skill_ids: skills.pluck(:id),
        interest_ids: interests.pluck(:id),
        strength_ids: strengths.pluck(:id)
      } 
    end
    
    private

      def quality_names_for(quality)
        send(quality).pluck(:label)
      end 

      def text_search
        "#{name} #{country} #{city} #{graduation} #{quality_names_for(:skills)}
        #{quality_names_for(:interests)} #{quality_names_for(:strengths)}
        "
      end

      
  end
end
