module Nxt
    module Student
        module Search
            module Filter
                class FilterOneYearAhead
                    def initialize(search_results:)
                        @search_results = search_results
                    end

                    def separate(on_first_year = [], out_of_first_year = [])
                        @search_results.each do |result|
                            if result.start > 12.months.from_now.end_of_day
                                out_of_first_year << result
                            else
                                on_first_year << result
                            end
                        end
                        return_results(on_first_year, out_of_first_year)
                    end

                    def return_results(results_on_first_year, results_out_of_first_year)
                    {
                        results_on_first_year: results_on_first_year, 
                        results_out_of_first_year: results_out_of_first_year
                    }
                    end
                end
            end
        end
    end
end