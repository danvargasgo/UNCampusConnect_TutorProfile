class SkillsController < ApplicationController
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      render json: @skill, status: :created
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end