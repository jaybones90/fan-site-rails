class Movie < ActiveRecord::Base
  validates :title, :presence => true
  has_many :reviews

  scope :alpha, -> {order(:title)}

  scope :date, -> { order(:created_at) }

  scope :popular, -> {(
    select("movies.title, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("movies.id")
    .order("reviews_count DESC")
    .limit(3)
    )}

    def average
      reviews = []
      self.reviews.each do |review|
        reviews.push(review.rating)
      end
       reviews.inject { |sum, number| (sum += number) } / reviews.length.to_d

    end

end
