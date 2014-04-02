require 'pp'
require 'dotenv'
Dotenv.load

require 'digitalocean'

Digitalocean.client_id = ENV['CLIENT_ID']
Digitalocean.api_key = ENV['API_KEY']

# now we can use the digital ocean api
# first get list of sizes
# then get list of images
# then regions

result = Digitalocean::Droplet.all

if result.droplets.length === 0 
  puts 'No droplets found creating one....'
  droplet = Digitalocean::Droplet.create({
    name: 'my-first-droplet',
    size_id: '66',
    region_id: '3',
    image_id: '345791'
  });
  puts droplet.inspect 
else
  puts 'We have droplets'
  dropet = result.droplets.first
  PP.pp( result.droplets )
end
