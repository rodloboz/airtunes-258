require 'open-uri'

URL = 'https://raw.githubusercontent.com/rodloboz/lw-fullstack/master/airtunes/data/artists.json'

names = %w[rock hip\ hop jazz]

puts "Cleaning up database..."
[Album, Artist, Tag].each(&:destroy_all)

puts "Seeding database..."

serialized_artists = open(URL).read
artists = JSON.parse(serialized_artists)

Artist.create!(artists)
puts "Created #{Artist.count} artist(s)"

names.each { |name| Tag.create!(name: name) }
puts "Created #{Tag.count} tag(s)"

puts "Finished"
