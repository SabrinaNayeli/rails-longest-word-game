require 'json' # pas necessaire car require par defaut dans ruby
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
    if word[:found] == true
      @answer = 'congrats'
    elsif word[:found] == false
      @answer = "this word doesn't exist in english"
    end
  end
end
