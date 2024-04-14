puts "Clear all data"
Author.destroy_all
puts "Creating authors..."
10.times do
  author = Author.create(
    name: Faker::Book.author,
    academic_degree: Author::DEGREES.sample,
    lattes: Faker::Internet.url,
    avatar_img: Faker::Avatar.image,
    member: true
  )
  puts "Author #{author.name} created!"
end
