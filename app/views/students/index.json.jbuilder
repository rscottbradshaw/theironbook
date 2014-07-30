json.array!(@students) do |student|
<<<<<<< HEAD
  json.extract! student, :id, :name, :description, :year, :class, :imgUrl
=======
  json.extract! student, :id, :name, :description, :year, :cohort, :imgUrl
>>>>>>> i think its fixed
  json.url student_url(student, format: :json)
end
