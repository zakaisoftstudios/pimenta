# Defines a generic response with a default ok status, to be used on all api controllers
module ApiResponse
  def json(body, status = :ok)
    render json: body.to_json, status: status
  end

  def error_response(error_message, status = :bad_request)
    render json: {
      error: error_message
    }, status: status
  end

  def not_found_response
    render :head, status: :not_found
  end
end