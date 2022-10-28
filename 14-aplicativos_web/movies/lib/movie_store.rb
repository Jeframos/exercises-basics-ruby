require 'yaml/store'

#Classe para gerenciar a gravação de arquivo atarvés do YAML::Store
class MovieStore

    def initialize(file_name)  #O initialize vai buscar o nome do arquivo que será criado
        @store = YAML::Store.new(file_name)
    end

    #Este método 'all' será utilizado na rota '/movies' para apresentar os filmes adicionados ao arquivo 'movies.yml'
    def all
        @store.transaction do
            @store.roots.map {|key| @store[key]}
        end
    end

    #Este método irá adicionar um novo ID para cada filme incluido no formulario '/movies/create'
    def save(movie)
        @store.transaction do
            unless movie.id #Se filme não tiver um ID
                highest_id = @store.roots.max || 0  #Se o "@store.roots.max" estiver nil, então deve virar o valor 0.
                movie.id = highest_id + 1
            end
            @store[movie.id] = movie
        end
    end
end