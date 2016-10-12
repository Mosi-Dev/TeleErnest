do
function run(msg, matches)
  
  	if matches[1]:lower() == 'sethelpfwd' and matches[2] and is_sudo(msg) then
redis:set('bot:helpfwd',matches[2])
   return 'متن راهنما با موفقیت فوروارد میشود'
	end
  
  if matches[1]:lower() == 'delhelpfwd' and is_sudo(msg) then
redis:del('bot:helpfwd')
   return 'متن راهنما دیگر فوروراد نمیشود'
	end
  
    	if matches[1]:lower() == 'setsupportfwd' and matches[2] and is_sudo(msg) then
redis:set('bot:supportfwd',matches[2])
   return 'متن پشتیبانی با موفقیت فوروارد میشود'
	end
  
  if matches[1]:lower() == 'delsupportfwd' and is_sudo(msg) then
redis:del('bot:supportfwd')
   return 'متن پشتیبانی دیگر فوروراد نمیشود'
	end
  
    if matches[1]:lower() == 'setnerkhfwd' and matches[2] and is_sudo(msg) then
redis:set('bot:nerkhfwd',matches[2])
   return 'متن نرخ با موفقیت فوروارد میشود'
	end
  
  if matches[1]:lower() == 'delnerkhfwd' and is_sudo(msg) then
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
   "^[!/#]([sS]etsupportfwd) (.*)$",
"^[!/#]([sS]ethelpfwd) (.*)$",
   "^[!/#]([sS]etnerkhfwd) (.*)$",
    "^[!/#]([Dd]elnerkhfwd)$",
   "^[!/#]([Dd]elsupportfwd)$",
   "^[!/#]([Dd]elhelpfwd)$"
	}, 
	run = run 
}
