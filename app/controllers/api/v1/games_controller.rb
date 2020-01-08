class API::V1::GamesController < ApplicationController
  def index
    render json: Game.all
  end

private
  def set_game
    @game ||= Game.find(params[:id])
  end

  def game_create_params
    params.permit()
  end
end
