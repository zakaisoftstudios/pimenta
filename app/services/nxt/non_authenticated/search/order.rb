module Nxt
    module NonAuthenticated
        module Search
            class Order
                BY_CREATED_AT_DSC = 'created_at_dsc'

                def initialize(order_by:, results:)
                    @order_by = order_by
                    @results = results
                end

                def order_results
                    if @order_by.present?
                        return by_created_at_desc if @order_by == BY_CREATED_AT_DSC
                    end
                    @results
                end

                def by_created_at_desc
                    @results.sort_by { |r| - r.created_at.to_i }
                end
            end
        end
    end
end