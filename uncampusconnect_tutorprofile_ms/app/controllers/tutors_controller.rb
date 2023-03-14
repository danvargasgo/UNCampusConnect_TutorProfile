class TutorsController < ApplicationController
  def index
    @tutors = Tutor.all
    render_tutor(@tutors)
  end

  def show
    @tutor = Tutor.find(params[:id])
    render_tutor(@tutor)
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      add_update_skills
      add_update_languages
      add_update_schools
      add_update_jobs
      render_tutor(@tutor)
    else
      render json: { errors: @tutor.errors }, status: :unprocessable_entity
    end
  end

  def update
    @tutor = Tutor.find(params[:id])
    if @tutor.update(tutor_params)
      @tutor.skills.clear
      @tutor.languages.clear
      @tutor.schools.clear
      @tutor.jobs.clear
      add_update_skills
      add_update_languages
      add_update_schools
      add_update_jobs
      render_tutor(@tutor)
    else
      render json: { errors: @tutor.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    tutor = Tutor.find(params[:id])
    tutor.skills.clear
    tutor.languages.clear
    tutor.schools.clear
    tutor.jobs.clear
    tutor.destroy # Elimina el tutor

    head :no_content
  end

  private
  def tutor_params
    params.require(:tutor).permit(
      :name,
      :last_name,
      :phone,
      :description,
      :photo
    )
  end

  def tutor_level
    params.require(:tutor).permit(languages_attributes: %i[name level])
  end

  def tutor_skills
    params.require(:tutor).permit(skills_attributes: [:name])
  end

  def tutor_schools
    params.require(:tutor).permit(schools_attributes: %i[name start_year end_year title])
  end

  def tutor_jobs
    params.require(:tutor).permit(jobs_attributes: %i[name start_year end_year position])
  end

  def add_update_skills
    tutor_skills[:skills_attributes]&.each do |skill|
      skill_obj = Skill.find_or_create_by(name: skill[:name])
      @tutor.skills << skill_obj
    end
  end

  def add_update_languages
    tutor_level[:languages_attributes]&.each do |language|
      @tutor_languages_obj = Language.find_or_create_by(name: language[:name])
      TutorLanguage.find_or_create_by(tutor_id: @tutor.id, language_id: @tutor_languages_obj.id, level: language[:level])
    end
  end

  def add_update_schools
    tutor_schools[:schools_attributes]&.each do |school|
      @tutor_schools_obj = School.find_or_create_by(name: school[:name])
      TutorSchool.find_or_create_by(tutor_id: @tutor.id, school_id: @tutor_schools_obj.id, start_year: school[:start_year],
                                    end_year: school[:end_year], title: school[:title])
    end
  end

  def add_update_jobs
    tutor_jobs[:jobs_attributes]&.each do |job|
      @tutor_jobs_obj = Job.find_or_create_by(name: job[:name])
      TutorJob.find_or_create_by(tutor_id: @tutor.id, job_id: @tutor_jobs_obj.id, start_year: job[:start_year],
                                 end_year: job[:end_year], position: job[:position])
    end
  end

  def render_tutor(tutor)
    render json: tutor,
           include: {
             skills: {},
             languages: { through: :tutor_languages, include: :tutor_languages },
             jobs: { through: :tutor_jobs, include: :tutor_jobs },
             schools: { through: :tutor_schools, include: :tutor_schools }
           }
  end
end
