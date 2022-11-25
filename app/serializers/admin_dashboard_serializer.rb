require 'json_serializer'

class AdminDashboardSerializer < JsonSerializer
  attribute :companies_quantity
  attribute :companies_percentage
  attribute :job_offers_quantity
  attribute :students_quantity
  attribute :students_percentage
  attribute :subject_offers_quantity
  attribute :universities_quantity
  attribute :universities_percentage
  attribute :admins_quantity
  attribute :admins_percentage
  attribute :users_quantity
end
