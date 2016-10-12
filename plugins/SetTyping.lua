-- @Ernest_TM
function run(msg, matches)
local hash = 'bot:typing'
if is_sudo(msg) then
if matches[1] == "type" and matches[2] == 'yes' then
redis:set(hash, "on")
return "Typing > on"
elseif matches[1] == "type" and matches[2] == 'no' then
redis:del(hash)
return "Typing > off"
end
end
end
return {
patterns = {
"^[#!/](type) (yes)$",
"^[#!/](type) (no)$",
},
run = run
}
-- @Ernest_TM
