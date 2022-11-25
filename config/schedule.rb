ENV.each { |k, v| env(k, v) }
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']

every 1.day, at: '12:00 am' do
  rake "subject_offer:state_unpublished_if_start_date_expired"
end

every 1.day, at: '12:00 am' do
  rake "subject_offer:state_unpublished_if_start_date_expired", environment: "development"
end

every 1.day, at: '12:00 am' do
  rake "subject_offer:state_unpublished_if_start_date_expired", environment: "staging"
end
