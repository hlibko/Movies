require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')

get('/') do
  @movies = store.all
  erb :index
end

get('/new') do
  erb :new
end

post('/create') do
  @movie = Movie.new
  @movie.title = params['title']
  @movie.director = params['director']
  @movie.year = params['year']
  store.save(@movie)
  redirect '/'
end

get('/:id') do
  id = params['id'].to_i
  @movie = store.find(id)
  erb :show
end
