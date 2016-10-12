-- @Ernest_TM
do

function run(msg, matches)
local channel = redis:get('bot:channel')
		local team = redis:get('bot:team')
		if not team then
     team = 'Ernest TM'
    end
if not channel then
    channel = 'telegram.me/Ernest_TM'
    end
local mods = [[ 
👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : mod(مدیر)\n\n🆔SuperGroup ID : '..msg.to.id..'\n👥SuperGroup name : '..msg.to.title..'\n\n@'..msg.from.username..'\n@Roonx_Team
]]
 
 local admin = [[ 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : admin(ادمین)\n\n🆔SuperGroup ID : '..msg.to.id..'\n👥SuperGroup name : '..msg.to.title..'\n\n@'..msg.from.username..'\n@Roonx_Team
 ]]
 
 local owner = [[ 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : owner(مدیر کل)\n\n🆔SuperGroup ID : '..msg.to.id..'\n👥SuperGroup name : '..msg.to.title..'\n\n@'..msg.from.username..'\n@Roonx_Team
 ]]
 
 local member = [[ 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : member (کاربر)\n\n🆔SuperGroup ID : '..msg.to.id..'\n👥SuperGroup name : '..msg.to.title..'\n\n@'..msg.from.username..'\n@Roonx_Team
 ]]
 
 local sudo = [[ 👤Name : "..(msg.from.print_name or '').."\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : sudo(سودو)\n\n🆔SuperGroup ID : '..msg.to.id..'\n👥SuperGroup name : '..msg.to.title..'\n\n@'..msg.from.username..'\n@Roonx_Team
 ]]
 
 if msg.to.type == 'channel' and matches[1]:lower() == 'info' and matches[2] == nil then 
     
    if is_sudo(msg) then 
        return ' 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : sudo(سودو)\n\n🆔Group ID : '..msg.to.id..'\n👥Group name : '..msg.to.title..'\n\n@'..msg.from.username..'\n\n'..channel..'\n'..team
    elseif is_admin1(msg) then 
        return ' 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : admin (ادمین)\n\n🆔Group ID : '..msg.to.id..'\n👥Group name : '..msg.to.title..'\n\n@'..msg.from.username..'\n\n'..channel..'\n'..team
    elseif is_owner(msg) then 
        return ' 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : owner(مدیر کل)\n\n🆔Group ID : '..msg.to.id..'\n👥Group name : '..msg.to.title..'\n\n@'..msg.from.username..'\n\n'..channel..'\n'..team
    elseif is_momod(msg) then 
         return ' 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : mod(مدیر)\n\n🆔Group ID : '..msg.to.id..'\n👥Group name : '..msg.to.title..'\n\n@'..msg.from.username..'\n\n'..channel..'\n'..team
    else 
        return ' 👤Name : '..(msg.from.print_name or '')..'\n🅰first name : '..(msg.from.first_name or '')..'\n🅱last name : '..(msg.from.last_name or '')..'\n\n🆔ID : '..msg.from.id..'\n🌐username : @'..msg.from.username..'\n🚨rank : member (کاربر)\n\n🆔Group ID : '..msg.to.id..'\n👥Group name : '..msg.to.title..'\n\n@'..msg.from.username..'\n\n'..channel..'\n'..team
        end
end
 if msg.to.type == 'channel' and matches[1]:lower() == 'help' and matches[2] == 'owner' then 
     if is_owner(msg) then 
         return owner
    else return 'Only Admins or higher can See this !'
    end 
end

 if msg.to.type == 'channel' and matches[1]:lower() == 'help' and matches[2] == 'mod' then
     if is_momod(msg) then 
         return mods
    else return 'only Owners Or higher Can See this !'
    end 
end 

 if msg.to.type == 'channel' and matches[1]:lower() == 'help' and matches[2] == 'member' then
         return member
    end 
end

    
return {
 
  patterns = {
    "^[!/#]([Ii]nfo)$"
  }, 
  run = run 
}

end
-- @Ernest_TM
