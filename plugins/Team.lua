do
function run(msg, matches)
  
  	if matches[1]:lower() == 'setteam' and matches[2] and matches[3] and is_sudo(msg) then
redis:set('bot:team',matches[2])
redis:set('bot:channel',matches[3])
   return reply_msg(msg['id'],"تیم تنظیم شد\nنام تیم:<b> "..matches[2].."</b>\nلینک کانال: "..matches[3],ok_cb,false)
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
    channel = 'telegram.me/Ernest_TM'
    end
	 return reply_msg(msg['id'],"نام تیم:<b> "..team.."</b>\nلینک کانال: "..channel,ok_cb,false)
end
   end 
  end
  
  return {
	patterns = {
	"^[!/#]([sS]et[Tt]eam) (.*) (.*)$",
	"^[!/#]([Dd]el[Tt]eam)$",
	"^[!/#]([Tt]eam)$",
	}, 
	run = run 
}
