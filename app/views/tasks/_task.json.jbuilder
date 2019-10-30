json.extract! task, :id, :subject, :assigne, :status, :description, :created_by, :created_at, :updated_at
json.url task_url(task, format: :json)
