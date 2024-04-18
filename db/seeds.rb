require 'faker'
require 'open-uri'

def image_fetcher
  URI.open(Faker::Avatar.image)
  rescue
  URI.open("https://robohash.org/sitsequiquia.png?size=300x300&set=set1")
end

puts "Clear all data"
Author.destroy_all
Publication.destroy_all
puts "Creating seeds..."
10.times do | index |
  author = Author.create(
    name: Faker::Book.author,
    qualification: Author::QUALIFICATIONS.sample,
    lattes: Faker::Internet.url,
    # avatar_img: Faker::Avatar.image,
    member: true
  )
  author.avatar_img.attach({
     io: image_fetcher,
     filename: "#{index}_faker_image.jpg"
  })
  puts "Author #{author.name} created!"
end

30.times do
  publication = Publication.create(
    title: Faker::Book.title,
    year: Faker::Number.between(from: 2000, to: 2020),
    abstract: Faker::Lorem.paragraph,
    theme: Publication::THEMES.sample,
    publication_type: Publication::TYPES.sample
  )
  puts "Publication #{publication.title} created!"
end

puts "Adding authors to publications..."
Publication.all.each do |publication|
  authors = Author.all.sample(rand(1..2))
  publication.authors << authors
  puts "Authors added to publication #{publication.title}"
end

puts "adding publications to authors..."
Author.all.each do |author|
  publications = Publication.all.sample(rand(1..2))
  author.publications << publications
  puts "Publications added to author #{author.name}"
end
