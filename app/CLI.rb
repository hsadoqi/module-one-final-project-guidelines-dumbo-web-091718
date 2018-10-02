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

  player = Player.create(name: player_name)
  band = Band.create(name: band_name, genre: band_genre)
  player.update(band_id: band.id)
  band.update(player_id: player.id)
  puts `clear`
  return player, band
end



def band_stats(player, band)
  puts "Welcome, #{player.name}! Ready to put #{band.name} together?"
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

  band.update(presentation: presentation)
  band.update(stage_presence: stage_presence)
  band.update(tech_ability: technical_ability)
  band.update(lyrics: lyrics)

  return player, band
end



def judgecreation
  simon = Judge.create(
    name: "Simon",
    preferred_att1: "technical_ability",
    preferred_att2: "stage_presence")
  randy = Judge.create(
    name: "Randy",
    preferred_att1: "presentation",
    preferred_att2: "lyrics")
  paula = Judge.create(
    name: "Paula",
    preferred_att1: "stage_presence",
    preferred_att2: [
        "technical_ability",
        "lyrics",
        "presentation"
      ].sample)
end


def showdown(player1, player2)
  showdown = Performance.create
  showdown.battle([player1.band, player2.band])
  showdown.audience
  max = 0
  winner = nil
  bands = [player1.band, player2.band]
  bands.each do |band|
    total = band.grade# + band.applause_level
    if total > max
      max = total
      winner = band
    end
  end
  puts winner
end





def awards_ceremony(winner)
  Band.all.each do |band|
    Judge.each do |judge|
      judge.response(band.grade)
    end
    Performance.audience_response(band.applause_level)
  end
  #Announce winner
end
