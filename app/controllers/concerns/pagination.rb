module Pagination
  def paginate(result)
    Nxt::Pagination::Helper.add_total_items_count(
      items: Kaminari.paginate_array(result).page(params[:page]),
      total_items_count: result.size
    )
  end
end