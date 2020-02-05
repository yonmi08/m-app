json.content   @message.content
json.user_name @message.user.name
json.date      @message.user.created_at.strftime("%m/%d %H:%M")
json.id        @message.id
