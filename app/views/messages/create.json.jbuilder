json.id @comment.id
json.content @message.content
json.image @message.image.url
json.user.name @message.user.name
json.time @message.created_at.strftime("%Y/%m/%d %H:%M")
