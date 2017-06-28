

Movie.destroy_all

10.times do |index|
  Movie.create!(title: Faker::Superhero.power)
end

p "Created #{Movie.count} lists"

Review.destroy_all

1000.times do |index|
  Review.create!(
               title: Faker::Lorem.sentence(5, false, 0).chop,
               description: Faker::Lorem.sentence(50, false, 0).chop,
               author: Faker::HarryPotter.character,
               rating: Faker::Number.between(0, 5),
               movie_id: Faker::Number.between(1, 10)
            )
end

p "Created #{Review.count} tasks"
