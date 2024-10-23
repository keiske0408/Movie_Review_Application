class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @top_movies = Movie.joins(:reviews)
                       .select('movies.*, AVG(reviews.rating) AS average_rating')
                       .group('movies.id')
                       .order('average_rating DESC')
                       .limit(3)

    @genres = Genre.all

    @movies = Movie.includes(:genres, :user)

    if params[:genre].present?
      @movies = @movies.joins(:genres).where(genres: { id: params[:genre] })
    end

    if params[:showing_status].present?
      now = Time.current
      case params[:showing_status]
      when "showing"
        @movies = @movies.where('showing_start <= ? AND showing_end >= ?', now, now)
      when "upcoming"
        @movies = @movies.where('showing_start > ?', now)
      when "ended"
        @movies = @movies.where('showing_end < ?', now)
      end
    end

    @movies = @movies.joins(:reviews)
                     .select('movies.*, AVG(reviews.rating) AS average_rating')
                     .group('movies.id')
                     .order('average_rating DESC')
    # @top_movies = Movie.includes(:genres).order('average_rating DESC').limit(3)
    @movies = @movies.page(params[:page]).per(5)

    params[:page] = params[:page].present? ? params[:page] : "1"
    session[:last_movies_page] = params[:page].present? ? params[:page] : session[:last_movies_page]
  end


  # GET /movies/1 or /movies/1.json
  def show
    # render :json => params
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    if @movie.update(movie_params)
      redirect_to movies_path(page: session[:last_movies_page]), notice: "Movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_path, status: :see_other, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    # @movie = Movie.find(params[:id])
    # render :json => params
    @movie = Movie.find_by!(slug: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :blurb, :date_released, :country_of_origin, :showing_start, :showing_end, :slug)
  end
end
