puts "Clear all data"
Author.destroy_all
Publication.destroy_all
puts "Creating seeds..."
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

10.times do
  publication = Publication.create(
    title: Faker::Book.title,
    year: Faker::Number.between(from: 2000, to: 2020),
    abstract: Faker::Lorem.paragraph,
    theme: Publication::THEMES.sample,
    category: Publication::CATEGORIES.sample,
    # author_id: Author.all.sample.id
  )
  puts "Publication #{publication.title} created!"
end
