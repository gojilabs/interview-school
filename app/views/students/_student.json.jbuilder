json.extract! student, :id, :name, :surname, :year, :created_at, :updated_at
json.url student_url(student, format: :json)
