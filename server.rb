require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'

set :bind, '0.0.0.0'
set :environment, :production

KNOW_TYPES=%w(png jpg jpeg)
IMGFOLDER=ENV['IMGFOLDER']
unless IMGFOLDER
  raise Exception.new("IMGFOLDER Environment variable is not set")
end
unless File.exist?(IMGFOLDER)
  raise Exception.new("'#{IMGFOLDER}' does not exists.")
end

get '/' do
  @images = KNOW_TYPES.map {|t| Dir.glob("#{IMGFOLDER}/**/*.#{t}") }.flatten.
    map { |i| "img/#{i.gsub(IMGFOLDER, '')}" }
  haml :index, :format => :html5
end

get '/img/:i' do
  filename = "#{IMGFOLDER}/#{params[:i]}"
  puts "FILENAME #{filename}"
  send_file(filename)
end
