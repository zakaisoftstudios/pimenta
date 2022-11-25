module JobOfferSearchable
  extend ActiveSupport::Concern

  included do
    searchkick(
      word_start: [:text_search],
      locations: [:location]
    )

    def search_data
      {
        text_search: text_search,
        state: state,
        wage: wage,
        start: start,
        minimum_degree: minimum_degree,
        category: category,
        working_hours_per_week: working_hours_per_week,
        location: { lat: latitude, lon: longitude },
        skill_ids: skills.pluck(:id),
        interest_ids: interests.pluck(:id),
        strength_ids: strengths.pluck(:id)
      } 
    end
    
    private

    def text_search
      "#{company_profile.name} #{country} #{city} #{content}"
    end
  end
end
