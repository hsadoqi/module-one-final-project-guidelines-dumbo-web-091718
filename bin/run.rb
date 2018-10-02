require_relative '../config/environment'



puts `clear`
introduction

player1, band1 = set_player
player1, band1 = band_stats(player1, band1)
player2 = Player.create(name: "Computer Richard")

band2 = Band.create(name: "MC MicroRichard", genre: "rap",
  presentation: 4,
  stage_presence: 3,
  tech_ability: 2,
  lyrics: 1)

puts showdown(player1, player2)
