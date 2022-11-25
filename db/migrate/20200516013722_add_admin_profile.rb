class AddAdminProfile < ActiveRecord::Migration[5.0]
  def change
    admin_user = User.create!(
      email: 'c2su@admin.com',
      password: 'adminc2su28736',
      confirm_token: 'adminc2su28736',
      email_confirmed: true
    )

    admin_profile = AdminProfile.create!(
      user: admin_user,
      name: 'Mike Westermann'
    )
  end
end
