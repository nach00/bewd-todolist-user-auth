# class AddUserIdToSessions < ActiveRecord::Migration[8.0]
#   def change
#     create_table :sessions do |t|
#       t.belongs_to :user, foreign_key: true
#       t.string :token
#       t.timestamps
#     end
#   end
# end
#
# class AddUserIdToSessions < ActiveRecord::Migration[7.0]
#   def change
#     # The table is already being created with user_id in another migration
#     # This migration is unnecessary and can be made a no-op
#     # If the sessions table doesn't exist yet, the other migration will handle it
#     # If it exists but doesn't have user_id, only then add the column
#     return if column_exists?(:sessions, :user_id)
#
#     add_reference :sessions, :user, foreign_key: true
#   end
# end

class AddUserIdToSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.belongs_to :user, foreign_key: true
      t.string :token, null: false
      t.timestamps
    end

    add_index :sessions, :token, unique: true
  end
end
