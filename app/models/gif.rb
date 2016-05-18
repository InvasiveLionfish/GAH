class Gif < ActiveRecord::Base
  attr_reader :url

  def self.random
    newgif = Gif.new
    newgif.url=JSON.load(open("http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC"))['data']['url']
    newgif.save
  end



end
