class AddTokenToSessions < ActiveRecord::Migration[7.2]
  def change
    add_column :sessions, :token, :string
  end
end
