class CreateTutorLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_languages do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.string :level

      t.timestamps
    end
  end
end
