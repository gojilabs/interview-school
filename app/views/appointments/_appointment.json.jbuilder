json.extract! appointment, :id, :student_id, :section_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
