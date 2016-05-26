class SessionsController < ApplicationController


  def create
    #session[:username] = params[:username]
    #cookies.signed[:username] = params[:username]



    #if it comes from sign-in 
        #just sing user in

    if params[:commit]=="Sign-In"

        @member = Member.find_by(username: params[:member][:username])
        return head(:forbidden) unless @member.authenticate(params[:member][:password])
        session[:user_id] = @member.id
        session[:member]=is_member?
        redirect_to :root and return 
    end


    #this comes from join
    if params[:existing_game_number]  #this is so hacky and needs to be improved
       #this could have come from a logged in user or a guest

    #guest
        if !is_member? && params[:username]
            @player=Player.create(username: params[:username])
            session[:user_id] = @player.id
        end


    #member
        if is_member?
            @player=Player.find(session[:user_id])
        end

    

    #both
    @player.score=0
    @game=Game.find_or_create_by(id: params[:existing_game_number])
    session[:game_id]=@game.id
    @game.players << @player # shovel all the player into the game that they specify

    @player.db_starting_hand
 

    redirect_to game_path(@game)
    end
 end
    


    def logout
        reset_session
        redirect_to '/'
    end


end
