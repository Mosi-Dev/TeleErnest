do
function run(msg, matches)
  
  	if matches[1]:lower() == 'sethelp' and matches[2] and is_sudo(msg) then
redis:set('bot:help',matches[2])
   return 'متن راهنما با موفقیت ثبت شد'
	end
  
  if matches[1]:lower() == 'delhelp' and is_sudo(msg) then
redis:del('bot:help')
   return 'متن راهنما دیگر ارسال نمیشود'
	end
  
  if matches[1]:lower() == 'setsupport' and matches[2] and is_sudo(msg) then
redis:set('bot:support',matches[2])
   return 'متن پشتیبانی با موفقیت ثبت شد'
	end
  
  if matches[1]:lower() == 'delsupport' and is_sudo(msg) then
redis:del('bot:support')
   return 'متن پشتیبانی پاک شد'
	end
  
  if matches[1]:lower() == 'setnerkh' and matches[2] and is_sudo(msg) then
redis:set('bot:nerkh',matches[2])
   return 'متن نرخ با موفقیت ثبت شد'
	end
  
  if matches[1]:lower() == 'delnerkh' and is_sudo(msg) then
redis:del('bot:nerkh')
   return 'متن نرخ پاک شد'
	end
  
	if matches[1]:lower() == 'support' then
   local support = redis:get('bot:support')
   if not support then
    return
    end
   send_msg(get_receiver(msg), support, ok_cb, false)
	end

if matches[1]:lower() == 'nerkh' then
   local nerkh = redis:get('bot:nerkh')
   if not nerkh then
    return
    end
   send_msg(get_receiver(msg), nerkh, ok_cb, false)
	end
  
if msg.to.type == 'channel' or msg.to.type == 'chat' then
	if matches[1]:lower() == 'help' then
    local help = redis:get('bot:help')
   if not help then
    return
    end
    send_msg(get_receiver(msg), help, ok_cb, false)
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
	}, 
	run = run 
}
