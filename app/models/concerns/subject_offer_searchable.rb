module SubjectOfferSearchable
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
        cost_amount: cost_amount,
        location: { lat: latitude, lon: longitude },
        nummerus_clausus: nummerus_clausus,
        duration_in_hours: duration_in_hours,
        start_date: start_date,
        type_of_degree: type_of_degree,
        minimum_degree: minimum_degree,
        skill_ids: skills.pluck(:id),
        interest_ids: interests.pluck(:id),
        strength_ids: strengths.pluck(:id),
      } 
    end
    
    private

    def text_search
      "#{university_profile.name} #{country} #{city} #{name}"
    end      
  end
end
