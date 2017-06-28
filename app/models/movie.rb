class Movie < ActiveRecord::Base
  validates :title, :presence => true
  has_many :reviews

  scope :alpha, -> {order(:title)}

  scope :date, -> { order(:created_at) }

end
