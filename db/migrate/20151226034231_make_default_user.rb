class MakeDefaultUser < ActiveRecord::Migration
  def change
    user = User.new(email: "guest@example.com", firstname: "guest", lastname: "guest", password: "password")
    user.save
  end
end
