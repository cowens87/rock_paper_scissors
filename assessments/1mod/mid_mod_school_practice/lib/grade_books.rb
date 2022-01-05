class GradeBook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses    = []
  end

  def add_course(course)
    @courses << course
  end

  def students_in_course(option)
    option.students
  end

  def all_students
    @courses.flat_map do |course|
      course.students
    end
  end

  def low_scores
    all_students.select do |student|
      student.grade <= 60
    end
  end
end
