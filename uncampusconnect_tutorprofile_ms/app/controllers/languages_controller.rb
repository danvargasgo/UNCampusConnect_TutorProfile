class LanguagesController < ApplicationController
  def create
    @language = Language.new(language_params)
    if @language.save
      render json: @language, status: :created
    else
      render json: @language.errors, status: :unprocessable_entity
    end
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end
end
