require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')

get('/movies') do
    @movies = store.all  #Este método 'all' está presente no arquivo 'movie_store.rb'
    erb :index
end

get('/movies/new') do
    erb :new
end

post('/movies/create') do
    @movie = Movie.new
    @movie.title =    params['title']   #Esses métodos 'params['']' retornam as informações cadastradas no formulario do arquivo 'new.erb'
    @movie.director = params['director']
    @movie.year =     params['year']
    store.save(@movie)  #Este método 'save' está presente no arquivo 'movie_store.rb'
    redirect '/movies/new' #Esta paravra chave 'redirect', ira retornar para o formulario quando o usuário clicar no botão submit
end

#Carregar filmes baseados no arquivo "movies.yml"
get('/movies/:id') do
    id = params['id'].to_i
    @movie = store.find(id)
    erb :show
end