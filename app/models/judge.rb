class Judge < ActiveRecord::Base
  has_many :bands, through: :performance

  def grade(band)
  happy = false
  band_stats = [
    1,2,3,4
  ]
  scores = []
    band_stats.each do |stat|
      if stat == self.preferred_att1 && stat >= 4
        happy = true
        scores << 5
      elsif stat == self.preferred_att2 && stat >= 3
        scores << 4
      else
        scores << stat / 2
      end
      grade = (scores.reduce(:+) / scores.length)
      return grade, happy
    end
  end

  #def response(grade())
    #Perfect response if happy and grade > 2.5
    #Great response if happy and grade >= 2
    #Good response if not happy and grade >= 2
    #Ok response if grade = 1.75
    #Bad response if grade <1.75
  #end

end
