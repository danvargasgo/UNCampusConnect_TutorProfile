class CreateTutorSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_schools do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.string :title
      t.date :start_year
      t.date :end_year

      t.timestamps
    end
  end
end
