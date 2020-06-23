# frozen_string_literal: true

# class School
class School
  def initialize
    @students = Hash.new { |grade, name| grade[name] = [] }
  end

  def students(grade)
    @students[grade].sort
  end

  def students_by_grade
    @students.sort.map { |g, n| { grade: g, students: n.sort } }
  end

  def add(student, grade)
    @students[grade] << student
  end
end
