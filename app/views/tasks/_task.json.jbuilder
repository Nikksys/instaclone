json.extract! task, :id, :title, :tag, :created_at, :updated_at
json.url task_url(task, format: :json)
