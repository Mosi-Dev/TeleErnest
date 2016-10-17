-- @Ernest_TM
do
function run(msg, matches)

if matches[1]:lower() == 'setteam' and matches[2] and matches[3] and is_sudo(msg) then
redis:set('bot:team',matches[2])
redis:set('bot:channel',matches[3])
   return reply_msg(msg['id'],"تیم تنظیم شد\nنام تیم:<b> "..matches[2].."</b>\nلینک کانال: "..matches[3],ok_cb,false)
	end
		
  if matches[1]:lower() == 'linkpv' and is_momod(msg) then
	local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
        return "لطفا لینک جدیدی تنظیم کنید:("
       end
         local text = "لینک گروه:\n"..group_link
          send_large_msg('user#id'..msg.from.id, text, ok_cb, false)
           return "لینک به پی وی شما ارسال شد"
end
		
if matches[1]:lower() == 'msgid' and msg.reply_id and is_momod(msg) then
   reply_msg(msg.reply_id,'آیدی این پیام\n'..msg.reply_id,ok_cb,false)
	end		
		
  if matches[1]:lower() == 'delteam' and is_sudo(msg) then
redis:del('bot:team')
redis:del('bot:channel')
   return reply_msg(msg['id'],'تیم حذف شد از این پس متن پیشفرض جایگزین میشود.',ok_cb,false)
	end
		
	if matches[1]:lower() == 'team' then
     local team = redis:get('bot:team')
local channel = redis:get('bot:channel')
   if not team then
     team = 'Ernest TM'
    end
if not channel then
    channel = '@Ernest_TM'
    end
	 return reply_msg(msg['id'],"نام تیم:<b> "..team.."</b>\nلینک کانال: "..channel,ok_cb,false)
end		
		
if matches[1] == 'sendplug' and matches[2] and is_sudo(msg) then
local file = matches[2]
reply_msg(msg['id'],"کمی صبر کنید !!!",ok_cb,false)
send_document(get_receiver(msg),"./plugins/"..file..".lua",ok_cb,false)
	end
		if matches[1] == 'html' and matches[2] and is_momod(msg) then
return matches[2]
	end
		if matches[1] == 'reply' and matches[2] and is_sudo(msg) then
reply_msg(msg.reply_id,matches[2],ok_cb,false)
			end
		
if matches[1] == 'bc' and is_admin1(msg) then
		local response = matches[3]
		send_large_msg("channel#id"..matches[2], response)
	end
	if matches[1] == 'bcfwd' and is_admin1(msg) then
		local response = matches[3]
		fwd_msg("channel#id"..matches[2], response,ok_cb,false)
	end
	if matches[1] == 'broadcast' then
		if is_sudo(msg) then -- Only sudo !
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local chat = 'chat#id'..chat_id
				local channel = 'channel#id'..chat_id
				send_large_msg(chat, response)
				send_large_msg(channel, response)
			end
		end
		end	
		if matches[1] == 'feedback' and matches[2] then
		local fuse = 'پیامی جدید :\n————————————————————\nآیدی: ' .. msg.from.id .. '\nنام: ' .. msg.from.print_name ..'\nیوزرنیم: @' .. msg.from.username  ..'\nنام گروه: '..string.gsub(msg.to.print_name, "_", " ")..'\nآیدی گروه: ' .. msg.to.id ..'\n——————————————————\nمتن پیام: ' .. matches[2] 
local id = redis:get('bot:idsudo')
fwd_msg('user#id'..id, msg.id, ok_cb, false)
send_large_msg('user#id'..id, fuse, ok_cb, false)
 reply_msg(msg['id'],"پیام شما به پشتیبانی ارسال شد.",ok_cb,false)
end

		if matches[1]:lower() == 'sudo' and is_sudo(msg) then
local user = redis:get('bot:usernamesudo')
local id = redis:get('bot:idsudo')
			local name = redis:get('bot:namesudo')
   reply_msg(msg['id'],"یوزر با مشخصات زیر به گروه ها دعوت,و نظرات به ایشون ارسال میشوند:\n<i>USER ID: </i>"..id.."\n<i>USERNAME:</i> @"..user.."\n<i>Name:</i> "..name ,ok_cb,false)
	end
		
	if matches[1]:lower() == 'setsudo' and matches[2] and matches[3] and matches[4] and is_sudo(msg) then
redis:set('bot:usernamesudo',matches[3])
redis:set('bot:idsudo',matches[2])
redis:set('bot:namesudo',matches[4])
   return "از این پس با دستورات\n#addsudo\nدعوت سودو\nدعوت "..matches[4].."\n#inv "..matches[4].."\nسودو دعوت میشود"
	end
  
  	if matches[1]:lower() == 'sethelp' and matches[2] and is_sudo(msg) then
redis:set('bot:helpfwd',matches[2])
   return 'متن راهنما با موفقیت فوروارد میشود'
	end
  
  if matches[1]:lower() == 'delhelp' and is_sudo(msg) then
redis:del('bot:helpfwd')
   return 'متن راهنما دیگر فوروراد نمیشود'
	end
  
    	if matches[1]:lower() == 'setsupport' and matches[2] and is_sudo(msg) then
redis:set('bot:supportfwd',matches[2])
   return 'متن پشتیبانی با موفقیت فوروارد میشود'
	end
  
  if matches[1]:lower() == 'delsupport' and is_sudo(msg) then
redis:del('bot:supportfwd')
   return 'متن پشتیبانی دیگر فوروراد نمیشود'
	end
  
    if matches[1]:lower() == 'setnerkh' and matches[2] and is_sudo(msg) then
redis:set('bot:nerkhfwd',matches[2])
   return 'متن نرخ با موفقیت فوروارد میشود'
	end
  
  if matches[1]:lower() == 'delnerkh' and is_sudo(msg) then
redis:del('bot:nerkhfwd')
   return 'متن نرخ دیگر فوروارد نمیشود'
	end
  
  	if matches[1]:lower() == 'support' then
   local supportfwd = redis:get('bot:supportfwd')
   if not supportfwd then
    return
    end
	fwd_msg(get_receiver(msg), supportfwd, ok_cb, false)
	end
  
  if matches[1]:lower() == 'nerkh' then
   local nerkhfwd = redis:get('bot:nerkhfwd')
   if not nerkhfwd then
    return
    end
	fwd_msg(get_receiver(msg), nerkhfwd, ok_cb, false)
	end
  
  if msg.to.type == 'channel' or msg.to.type == 'chat' then
	if matches[1]:lower() == 'help' then
     local helpfwd = redis:get('bot:helpfwd')
   if not helpfwd then
    return
    end
	fwd_msg(get_receiver(msg), helpfwd, ok_cb, false)
end
   end 
  end
 end
  
  return {
	patterns = {
		"^[!/#]([sS]upport)$",
			"^[!/#]([hH]elp)$",
			"^[!/#]([nN]erkh)$",
   "^[!/#]([sS]etsupport) (.*)$",
"^[!/#]([sS]ethelp) (.*)$",
   "^[!/#]([sS]etnerkh) (.*)$",
    "^[!/#]([Dd]elnerkh)$",
   "^[!/#]([Dd]elsupport)$",
   "^[!/#]([Dd]elhelp)$",
"^[!/#]([sS]end[Pp]lug) (.*)$",
"^[!/#]([Ff]eed[Bb]ack) (.*)$",
"^[!/#]([Hh]tml) (.*)$",
 "^[!/#]([Ss]et[Ss]udo) (%d+) (.*) (.*)$",
 "^[!/#]([Ss]udo)$",
 "^[!/#]([Rr]eply) (.*)$",
"^[#!/](broadcast) (.*)$",
"^[!/#]([sS]et[Tt]eam) (.*) (.*)$",
	"^[!/#]([Dd]el[Tt]eam)$",
	"^[!/#]([Tt]eam)$",
    "^[#!/](bc) (%d+) (.*)$",
"^[#!/](bcfwd) (%d+) (.*)$",
"^[#!/]([Mm]sgid)$",
"^[#!/]([Ll]inkpv)$"
	}, 
	run = run 
}
-- @Ernest_TM
