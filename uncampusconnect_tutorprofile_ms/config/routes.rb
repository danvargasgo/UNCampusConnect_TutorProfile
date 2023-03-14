Rails.application.routes.draw do
  resources :tutors do
    collection do
      post 'create_with_skills_and_languages_and_schools_and_jobs'
    end
  end

  resources :skills
  resources :languages
  resources :schools
  resources :jobs
end
