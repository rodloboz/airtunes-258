require 'open-uri'

URL = 'https://raw.githubusercontent.com/rodloboz/lw-fullstack/master/airtunes/data/artists.json'

names = %w[rock hip\ hop jazz]

puts "Cleaning up database..."
[Album, Artist, Tag].each(&:destroy_all)

puts "Seeding database..."

serialized_artists = open(URL).read
artists_json = JSON.parse(serialized_artists)

artists_json.each do |artist_hash|
  artist = Artist.new(name: artist_hash["name"])
  artist.remote_photo_url = artist_hash["image_url"]
  artist.save!
end

puts "Created #{Artist.count} artist(s)"

names.each { |name| Tag.create!(name: name) }
puts "Created #{Tag.count} tag(s)"

puts "Finished"
