json.extract! admin, :id, :username, :role, :permissions, :user_id, :created_at, :updated_at
json.url admin_url(admin, format: :json)
