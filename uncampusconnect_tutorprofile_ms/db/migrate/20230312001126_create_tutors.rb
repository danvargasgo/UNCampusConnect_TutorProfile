class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :last_name
      t.string :birth_place
      t.date :birthdate
      t.string :address
      t.string :email
      t.string :phone
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
