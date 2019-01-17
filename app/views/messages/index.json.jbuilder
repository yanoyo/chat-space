json.array! @new_messages do |message|
  json.id message.id
  json.content message.content
  json.image message.image.url
  json.user_name message.user.name
  json.time message.created_at.strftime("%Y/%m/%d %H:%M")
end
