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
  
  def destroy

    the_id = params.fetch("an_id")
    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)
    the_movie.destroy

    redirect_to("/movies")
  end

  def update
    the_id = params.fetch("the_id")
    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)

    title = params.fetch("the_title")
    year = params.fetch("the_year")
    duration = params.fetch("the_duration")
    description = params.fetch("the_description")
    image = params.fetch("the_image")
    director_id = params.fetch("the_director_id")

    the_movie.title = title
    the_movie.year = year
    the_movie.duration = duration
    the_movie.description = description
    the_movie.image = image
    the_movie.director_id = director_id

    the_movie.save

    redirect_to("/movies/#{the_movie.id}")
  end
end
