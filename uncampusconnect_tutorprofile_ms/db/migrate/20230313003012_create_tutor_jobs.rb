class CreateTutorJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_jobs do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.string :position
      t.date :start_year
      t.date :end_year

      t.timestamps
    end
  end
end
