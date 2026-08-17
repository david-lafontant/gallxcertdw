json.extract! item, :id, :name, :description, :price, :picture, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
json.picture url_for(item.picture)
