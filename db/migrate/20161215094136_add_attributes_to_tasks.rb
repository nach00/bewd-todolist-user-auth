class AddAttributesToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :content, :string
    add_column :tasks, :completed, :boolean, default: false
  end
end
