json.extract! video, :id, :title, :description, :url, :thumb, :created_at, :updated_at
json.url video_url(video, format: :json)
