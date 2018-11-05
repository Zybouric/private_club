json.extract! session, :id, :first_name, :last_name, :email, :created_at, :updated_at
json.url session_url(session, format: :json)
