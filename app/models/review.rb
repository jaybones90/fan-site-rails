class Review < ActiveRecord::Base
  validates :title, :description, :author, :rating, :presence => true
  belongs_to :movie
end
