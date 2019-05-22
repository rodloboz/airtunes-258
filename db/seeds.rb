require 'open-uri'

URL = 'https://raw.githubusercontent.com/rodloboz/lw-fullstack/master/airtunes/data/artists.json'

puts "Cleaning up database..."
[Album, Artist].each(&:destroy_all)

puts "Seeings database..."

serialized_artists = open(URL).read
artists = JSON.parse(serialized_artists)

Artist.create!(artists)

puts "Created #{Artist.count} artist(s)"
puts "Finished"
