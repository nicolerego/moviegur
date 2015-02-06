class MoviesController < ApplicationController
	def index
		@movies = Movie.all
		@most_recent_movies = Movie.most_recent_three
		@older_than_one_month = Movie.created_before(1.month.ago)
	end 

	def show
		@movie = Movie.find(params[:id])
	end 

	def new
		@movie = Movie.new
	end 

	def create 
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to movies_url
		else
			render :new
		end
	end 

	def edit
		@movie = Movie.find(params[:id])
	end 

	def update 
		@movie = Movie.find(params[:id])
		if @movie.update_attributes(movie_params)
			# redirect_to "/movies/#{@movie.id}"
			redirect_to movie_path(@movie)
		else 
			render :edit
		end 
	end 

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_url
	end 

	private
	def movie_params
		params.require(:movie).permit(:title, :director, :rating, :poster, :synopsis)
	end 
end
