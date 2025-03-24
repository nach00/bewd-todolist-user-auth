class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    return if table_exists?(:sessions)

    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token
      t.timestamps
    end
  end
end
