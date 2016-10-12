function run(msg, matches)
local hash = 'bot:typing'
if redis:get(hash) then
send_typing(get_receiver(msg), ok_cb, false)
end
end
return {
patterns = {
"[/!#]",
},
run = run
}
