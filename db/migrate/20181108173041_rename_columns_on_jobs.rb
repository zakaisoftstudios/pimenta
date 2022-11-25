class RenameColumnsOnJobs < ActiveRecord::Migration[5.0]
  def change
  	rename_column	:job_offers,		:what_we_expect_from_you,				:what_is_expected_from_you
  	rename_column	:job_offers,		:what_you_can_expect_from_us,		:what_is_expected_from_us
  	rename_column	:job_offers,		:what_we_need_from_you,					:tasks
  	add_column		:job_offers,		:perspectives,									:text
  end
end
