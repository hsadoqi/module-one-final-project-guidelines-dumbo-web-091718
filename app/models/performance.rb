class Performance < ActiveRecord::Base
  has_many :bands
  has_many :judges

  def audience
    Band.all.each do |band|
      if band.genre == "pop" && band.stats[presentation] == 4
        band.applause_level = 5
      elsif band.genre == "rock" && band.stats[tech_ability] == 4
        band.applause_level = 5
      elsif band.genre == "rap" && band.stats[stage_presence] == 4
        band.applause_level = 5
      elsif band.genre == "country" && band.stats[lyrics] == 4
        band.applause_level = 5
      else
        band.applause_level = rand(3)
      end
    end
  end

#  def audience_response(applause_level)
    #10/10 applause if 5
    #8/10 applause if 3
    #6/10 applause if > 2 and < 3
    #4/10 applause if > 1 and < 2
    #1/10 applause if < 1
#  end

  def battle(band_array)
    band_array.each do |band|
      scores = Judge.all.map do |judge|
        judge.grade(band)
      end
      score = 12
      band
    end
  end


end
