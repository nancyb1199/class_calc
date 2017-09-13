# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  new_array = []
  new_array = grade_hash[student]
  score = new_array[assignment_num-1]
  return score
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  scores_array = []
  grade_hash.map do |name, grades|
    scores_array << grades[assignment_num-1]
  end
    return scores_array
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  score = 0
  grade_hash.map do |name, grades|
    score = score + grades[assignment_num-1]
  end
  score = score / grade_hash.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  new_hash={}
  grade_hash.map do |name, grades|
    score = 0
    grades.each do |grade|
      score = score + grade
    end
    avg = score/grades.length
    new_hash[name] = avg
  end
return new_hash
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  case score
    when 0..59
      return "F"
    when 60..69
      return "D"
    when 70..79
      return "C"
    when 80..89
      return "B"
    else
      return "A"
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  final_hash = {}
  new_hash = averages(grade_hash)
  new_hash.map do |name, average|
    letter = letter_grade(average)
    final_hash[name] = letter
  end
  return final_hash
end

# Return the average for the entire class.
def class_average(grade_hash)
  score = 0
  new_hash = averages(grade_hash)
  new_hash.map do |name, average|
    score = score + average
  end
  score = score / new_hash.length
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  students = []
  new_hash = averages(grade_hash)
  new_hash = new_hash.sort_by{ |name, avg| avg}.reverse
  i = 0
  while (i < number_of_students)
    temp_array = new_hash[i]
    students << temp_array[0]
    i += 1
  end
  return students
end
