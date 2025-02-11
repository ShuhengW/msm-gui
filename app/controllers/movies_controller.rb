class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    title = params.fetch("the_title")
    year = params.fetch("the_year").to_i
    duration = params.fetch("the_duration").to_i
    description = params.fetch("the_description")
    image = params.fetch("the_image")
    director_id = params.fetch("the_director_id").to_i
    
    Movie.create({
      title: title,
      year: year,
      duration: duration,
      description: description,
      image: image,
      director_id: director_id
    })

    redirect_to("/movies")
    end
end
