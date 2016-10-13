-- @Ernest_TM
do
local function callback(extra, success, result)
vardump(success)
vardump(result)
end
local function run(msg, matches)
local idsuodo = redis:get('bot:idsudo')
local user = idsuodo
local name = redis:get('bot:namesudo')
if matches[1] == "addsudo" or matches[1] == "دعوت سودو" or matches[1] == "دعوت "..name or matches[1] == "inv "..name then
user = 'user#id'..user
end
if is_owner(msg) then
    if msg.from.username ~= nil then
       local username = redis:get('bot:usernamesudo')
      if string.find(msg.from.username , username) then
          return "ℹ️سازنده هم اکنون در گروه است"
          end
if msg.to.type == 'channel' or 'chat' then
local channel = 'channel#id'..msg.to.id
chat_add_user(chat, user, ok_cb, false)
channel_invite(channel, user, ok_cb, false)
return "ℹ️درحال دعوت صاحب ربات برای حل مشکل شما..."
end
end
end
end
return {
patterns = {
"^[#!/]([Aa]ddsudo)$",
"^(دعوت سودو)$",
"^(دعوت )(.*)$",
"^[#!/](inv )(.*)$",
},
run = run
}
end

-- @Ernest_TM
