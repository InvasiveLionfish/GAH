class GameCreator 


  def initialize(payload, session, is_member)
    @payload=payload
    @session=session
    @is_member=is_member
  end

  def create_game_with_first_player  
    player= create_player_with_starting_hand
    game=Game.create()
    game.players << player
    Round.create(game_round: 1, game: game, judge: player).get_random_prompt
    game
  end


  def create_player_with_starting_hand

    if !@is_member && @payload[:username]
    @player=Player.create(username: @payload[:username])
    elsif @is_member
    @player=Player.find(@session[:user_id])
    end


    @player.score=0
    @player.db_starting_hand
    @player
  end





end