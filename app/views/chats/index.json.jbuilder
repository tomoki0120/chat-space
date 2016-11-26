json.array!(@posts) do |post|
  json.nickname post.user.nickname
  json.message post.message
  json.image post.text_image.url
  json.date post.post_date
end
