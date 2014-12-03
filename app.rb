require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database =>  'db/sqlite3.db'
)

class Url < ActiveRecord::Base

end

get '/' do
  @urls = Url.all
  erb :index
end

post '/add' do
  @url = Url.create( url: params[:url] )
  redirect '/'
end