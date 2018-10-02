class Player
has_one :band

@name

end


class Band
belongs_to :player

@name
@genre
@attributes = {
  tech_ability,
  presentation,
  stage_presence,
  lyrics
}
@grade
@applause_level

end

class Judge
has_many :bands through: :performance
has one :audience through: :performance

@name
@preferences = {
  preferred_att1,
  preferred_att2
  }

def grade(band)
happy = false
scores = []
 scores = band.attribute.map { |att|
   if att == preferred_att1 && att >= 4
     happy = true
     scores << 5
   if att == preferred_att2 && att >= 3
     scores << 4
   else
     scores << att / 2
   end
   grade = (scores.reduce(:+) / scores.length)
   return grade, happy
end

def response(grade())
  #Perfect response if happy and grade > 2.5
  #Great response if happy and grade >= 2
  #Good response if not happy and grade >= 2
  #Ok response if grade = 1.75
  #Bad response if grade <1.75
end

end

class Performance
  has_many :judges, :bands

  def audience
    Band.all.each do |band|
      if band.genre == "pop" && band.attributes[presentation] == 4
        band.applause_level = 5
      elsif band.genre == "rock" && band.attributes[tech_ability] == 4
        band.applause_level = 5
      elsif band.genre == "rap" && band.attributes[stage_presence] == 4
        band.applause_level = 5
      elsif band.genre == "country" && band.attributes[lyrics] == 4
        band.applause_level = 5
      else
        band.applause_level = rand(3)
    end
  end
  
  def audience_response(applause_level)
    #10/10 applause if 5
    #8/10 applause if 3
    #6/10 applause if > 2 and < 3
    #4/10 applause if > 1 and < 2
    #1/10 applause if < 1
  end

  def battle
    Band.all.each do |band|
      scores = Judge.all.map do |judge|
        judge.grade(band)
      end
      band.grade = scores.reduce(:+) / scores.length
    end
  end
end

**  CLI **

def battle
  Performance.battle
  Performance.audience
  max = 0
  winner = nil
  Band.all.each do |band|
    total = band.grade + band.applause_level
    if total > max 
      max = total
      winner = band
    end
  end
  winner
end

winner = battle

def awards_ceremony(winner)
Band.all.each do |band|
  Judge.each do |judge|
    judge.response(band.grade)
  end
  Performance.audience_response(band.applause_level)
end
#Announce winner
end

