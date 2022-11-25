# Handles some common exceptions and automatically returns the proper response
module ApiExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :error
    rescue_from ActiveRecord::RecordInvalid, with: :error
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  end

  private

  def error(e)
    print_exception(e) unless Rails.env == 'test'
    error_response(e.message)
  end

  def not_found
    not_found_response
  end

  def print_exception(e)
    puts e.inspect
    puts e.backtrace
  end
end
