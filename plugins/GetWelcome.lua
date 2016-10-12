-- @Ernest_TM

local function run(msg, matches, callback, extra)

local data = load_data(_config.moderation.data)

local group_welcome = data[tostring(msg.to.id)]['group_welcome']

if matches[1] == 'chat_add_user' or 'chat_add_user_link' then --For Normal Group
        group_welcome = string.gsub(group_welcome, 'GPNAME', msg.to.title)
group_welcome = string.gsub(group_welcome, 'FIRSTNAME', ""..(msg.action.user.first_name or '').."")
 group_welcome = string.gsub(group_welcome, 'LASTNAME', ""..(msg.action.user.last_name or '').."")
  group_welcome = string.gsub(group_welcome, 'USERNAME', "@"..(msg.action.user.username or '').."")
  group_welcome = string.gsub(group_welcome, 'FATIME', ""..(jdat.FAtime).."")
  group_welcome = string.gsub(group_welcome, 'ENTIME', ""..(jdat.ENtime).."")
  group_welcome = string.gsub(group_welcome, 'FADATE', ""..(jdat.FAdate).."")
  group_welcome = string.gsub(group_welcome, 'ENDATE', ""..(jdat.ENdate).."")
  group_welcome = string.gsub(group_welcome, 'RULES', ""..(rules or '').."")
  group_welcome = string.gsub(group_welcome, 'ABOUT', ""..(about or '').."")
    if not msg.service then 
        return nil 
    else
        return group_welcome
end
end
end
return {
  patterns = {
  "^!!tgservice (chat_add_user)$",
  "^!!tgservice (chat_add_user_link)$",
  },
  run = run,
  pre_process = pre_process
}
-- @Ernest_TM
