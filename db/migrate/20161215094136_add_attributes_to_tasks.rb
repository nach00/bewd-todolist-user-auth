class AddUserIdToTasks < ActiveRecord::Migration[7.0]
  def change
    return if column_exists?(:tasks, :user_id)

    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
