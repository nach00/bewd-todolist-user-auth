class CreateUsersIfNotExists < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:users)

    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
