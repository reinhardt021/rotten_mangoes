class MoviesController < ApplicationController
  def index
    if params[:title] || params[:director] || params[:runtime]
      
      title = ""
      director = ""

      title = "%#{params[:title].to_s}%" if params[:title]
      director = "%#{params[:director].to_s}%" if params[:director]
      runtime = params[:runtime].to_i

      sql = "title LIKE ? AND director LIKE ?"
      
      case runtime
      when 1 then sql += " AND runtime_in_minutes < 90"
      when 2 then sql += " AND runtime_in_minutes BETWEEN 90 AND 120"
      when 3 then sql += " AND runtime_in_minutes > 120"
      end
      
      @movies = Movie.where(sql, title, director)
      flash[:notice] = "Search results shown below"
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


  protected

  def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :poster_image_url, :image, :release_date, :remote_image_url)
  end

end
