class CreateJoinTableTutorSkill < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tutors, :skills do |t|
      t.index [:tutor_id, :skill_id]
      t.index [:skill_id, :tutor_id]
    end
  end
end
