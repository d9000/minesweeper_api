class API::V1::Users::GamesController < ApplicationController
  def index
    render json: set_user.games
  end

  def show
    render json: set_game, serializer: User::Game::ShowSerializer, status: 200
  end

  def create
    game = set_user.games.new(rows: params[:game][:rows],
                              cols: params[:game][:rows],
                              mines: params[:game][:mines]
                              )
    if game.save
      render json: game, serializer: User::Game::ShowSerializer, status: 200
    else
      render json: { errors: Game.errors }, status: 422
    end
  end

  def update
    game = set_game
    if game.update_attributes(update_params)
      render json: game, serializer: User::Game::ShowSerializer, status: 200
    else
      render json: { errors: Game.errors }, status: 422
    end
  end

private
  def set_game
    @game ||= set_user.games.find(params[:id])
  end

  def set_user
    @user ||= User.find(params[:user_id])
  end

  def create_params
    params.permit(:user_id, game: [ :mines, :rows, :cols ])
  end

  def update_params
    params.permit(:id, :user_id, :status)
  end
end
