require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'

# base sinatra setup
set :bind, '0.0.0.0'
set :environment, :production

# allowed image types.
KNOW_TYPES=%w(png jpg jpeg)

# IMGFOLDER environment variable setup
IMGFOLDER=ENV['IMGFOLDER']
unless IMGFOLDER
  raise Exception.new("IMGFOLDER Environment variable is not set")
end
unless File.exist?(IMGFOLDER)
  raise Exception.new("'#{IMGFOLDER}' does not exists.")
end

# root route
get '/' do
  # map all image types, searching for them inside image folder, then,
  # flatten from an array of arrays (one for each image type) to a single
  # array and finally map it to relative paths that will be managed by
  # "/img/*" route.
  @images = KNOW_TYPES.map { |t| Dir.glob("#{IMGFOLDER}/**/*.#{t}") }.flatten.
    map { |i| "img/#{i.gsub(IMGFOLDER+'/', '')}" }

  # respond with index.haml in html5
  haml :index, :format => :html5
end

# This route will translate /img/* requests to requests to the original
# files, doesn't matter where they are.
# With this, it is not needed to copy the images to the public folder.
get '/img/*' do
  image = "#{IMGFOLDER}/#{params[:splat].join('/')}"
  send_file(image)
end
