class AddUserIdToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :user_id, :string, null: false
    add_index :tutors, :user_id, unique: true
  end
end
