class Student
  attr_reader :name,
              :age,
              :scores

  def initialize(attributes)
    @name   = attributes[:name]
    @age    = attributes[:age]
    @scores = []
  end

  def log_scores(score)
    @scores << score
  end

  def grade
    @scores.sum do |score|
      score / @scores.count.to_f
    end
  end
end
