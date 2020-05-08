require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/attack'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    Attack.run(@game.opponent_of(@game.current_turn))
    erb(:attack)
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
