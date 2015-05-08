class RentalController < ApplicationController
  def index
    @movies = Movie.page(2).order(:updated_at => :desc)
  end

  def show
    @movie = Movie.find( params['id'])
  end
end
