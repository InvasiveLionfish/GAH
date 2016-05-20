class SelectionsController < ApplicationController
  def new
    render nothing: true
  end

  def create
    round =  Round.find_by_id(params[:round_id])
    gif =  Gif.find_by_id(params[:selection][:gif_id])
    player = Player.find_by_id(session[:user_id])
    Selection.create(selected_gif_id: gif.id, player: player, round: round)
    redirect_to round.game
  end

  def show
   
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
