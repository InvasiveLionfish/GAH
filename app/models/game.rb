class Game < ActiveRecord::Base
  has_many :rounds
  has_many :game_players
  has_many :players, through: :game_players
  belongs_to  :champion, class_name: "Player"

  @prompt_mode=false

  def has_player?(player)
    self.players.include?(player)
  end



  def multiple_prompt_mode=(prompt_mode)
    #only prompt_mode=false is supported
    @prompt_mode=prompt_mode
  end

  def multiple_prompt_mode?()
    #only prompt_mode=false is supported
    @prompt_mode
  end

def self.currentgame(session)
Game.find_by_id(session)
end








end
