json.array!(@posts) do |post|
  json.nickname post.user.nickname
  json.message post.message
  json.image post.text_image.url
  json.date post.created_at.strftime("%Y/ %m/ %d %T")
end
