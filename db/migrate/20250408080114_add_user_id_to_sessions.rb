class AddUserIdToSessions < ActiveRecord::Migration[7.2]
  def change
    add_belongs_to :sessions, :user
  end
end
