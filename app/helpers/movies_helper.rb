module MoviesHelper

  def formatted_date(date)
    date.strftime("%b %d, %Y")
  end

  def duration_select_options
    [
      ["~ duration ~", 0],
      ["Under 90 minutes", 1],
      ["Between 90 \& 120 minutes", 2],
      ["Over 120 minutes", 3]
    ]
  end

  def get_movie(id)
    Movie.find(id)
  end

  def movie_title(id)
    get_movie(id).title
  end

end
