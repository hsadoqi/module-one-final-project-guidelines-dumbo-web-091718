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

  player = Player.create({name: player_name, band_name: band_name, genre: band_genre})
  puts "clear"
  band_attributes(player)
end


def band_attributes(player)
  puts "Welcome, #{player.name}! Ready to put #{player.band_name} together?"
  puts "You now have 10 points to allocate however you want!\n"

  points = 10

      presentation = 0
      stage_presence = 0
      technical_ability = 0
      lyrics = 0

  while points > 0
    puts "You currently have #{points} points left."
    puts "Press 1 through 4 to allocate your points accordingly:"
    puts "1. Presentation"
    puts "2. Stage Presence"
    puts "3. Technical Ability"
    puts "4. Lyrics"


    user_input = gets.chomp
    case user_input.to_i
    when 1
      presentation += 1
      puts `clear`
    when 2
      stage_presence += 1
      puts `clear`
    when 3
      technical_ability += 1
      puts `clear`
    when 4
      lyrics += 1
      puts `clear`
    else
      puts "That is not a valid input. Try again."
      points += 1
    end

    points -= 1

  end
  puts "You have allocated the following points:"
  puts "Presentation: #{presentation}"
  puts "Stage Presence: #{stage_presence}"
  puts "Technical Ability: #{technical_ability}"
  puts "Lyrics: #{lyrics}"

  band = Band.create({presentation: presentation, stage_presence: stage_presence,
        tech_ability: technical_ability, lyrics: lyrics,
        band_name: player.band_name, genre_type: player.genre})
  band
end

  def judgecreation
    # Create judges here
  end

def battle
  # Pit Player's band against CPU band
  # - Grade player's performance
  #   o Evaluate Judge 1 score
  #   o Evaluate Judge 2 score
  #   o Evaluate Judge 3 score
  #   o Evaluate Audience score
  # - Grade CPU performance
  #   o Evaluate Judge 1 score
  #   o Evaluate Judge 2 score
  #   o Evaluate Judge 3 score
  #   o Evaluate Audience score
end

def awardceremony
  # Present Player 1 scores
  # Judges each provide a personalized score w/ text and video
  # Audience score is presented as applause level
  # Present Player 2 scores
  # Judges each provide a personalized score w/ text and video
  # Audience score is presented as applause level
  # Announce winner
end
