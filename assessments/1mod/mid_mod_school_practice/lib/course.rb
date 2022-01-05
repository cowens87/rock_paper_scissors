class Course
  attr_reader :name,
              :capacity,
              :students,
              :full

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
    @full = false
  end

  def enroll(student)
    @students << student
    @full = true if @students.count >= @capacity
  end

  def full?
    @full
  end
end
