-- @Ernest_TM
local function run(msg, matches)
if matches[1]:lower() == 'kickme' or matches[1]:lower() == 'خروج' then
local hash = 'kick:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "waite")
      return '🔖کاربر عزیز ('..msg.from.first_name..')\nشما درخواست اخراج خود از گروه را ارسال کردید\nاگر با این درخواست موافقت دارید عبارت yes را ارسال کنید'
    end

    if msg.text then
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^([Yy]es)$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^([Nn]o)$") and redis:get(hash) == "waite" then
	send_large_msg(get_receiver(msg), "لغو شد")
	  redis:del(hash, true)

      end
    end
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         return '❌کاربر مورد نظر بنابر درخواست خود از گروه ('..msg.to.title..') اخراج شد'
        end
      end
    end

return {
  patterns = {
  "^(خروج)$",
  "^([Kk]ickme)$",
  "^[!/#]([Kk]ickme)$",
  "^([Yy]es)$",
  "^([Nn]o)$"
  },
  run = run,
}
-- @Ernest_TM
