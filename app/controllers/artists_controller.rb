class ArtistsController < ApplicationController
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::MethodOverride
  

  get '/' do
    @artists = Artist.all
    erb :"/artists/index"
  end

  get '/artists' do
    @artists = Artist.all
    erb :"/artists/index"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artists/show"
  end

end
