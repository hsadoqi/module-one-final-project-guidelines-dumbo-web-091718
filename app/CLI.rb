require_relative '../config/environment'

def introduction
  puts "Welcome to Battle of the Bands!"
end

def set_player
  puts "What is your name?"
  player_name = gets.chomp

  puts "What is the name of your band?"
  band_name = gets.chomp

  puts "What genre will your band play?"
  band_genre = gets.chomp

  Player.create({name: player_name, band_name: band_name, genre: band_genre})
end
