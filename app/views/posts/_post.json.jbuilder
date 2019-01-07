json.extract! post, :id, :name, :coment, :image, :created_at, :updated_at
json.url post_url(post, format: :json)
