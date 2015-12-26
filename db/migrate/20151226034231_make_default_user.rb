class MakeDefaultUser < ActiveRecord::Migration
  def change
    user = User.new(email: "guest@example.com", firstname: "Guest", lastname: "Guest", password: "password")
    user.save
    admin = User.new(email: "admin@example.com", firstname: "Admin", lastname: "Admin", password: "password", admin: true)
    admin.save
  end
end
