-- @Ernest_TM
local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['fosh'] then
                lock_fosh = data[tostring(msg.to.id)]['settings']['fosh']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_fosh == "yes" then
       delete_msg(msg.id, ok_cb, true)
    end
end
 
return {
  patterns = {
    "(ک*س)$",
    "کیر",
	"کص",
	"کس ننت",
	"کس",
	"کــــــــــیر",
	"کــــــــــــــــــــــــــــــیر",
	"کـیـــــــــــــــــــــــــــــــــــــــــــــــــــر",
    "ک×یر",
	"ک÷یر",
	"ک*ص",
	"کــــــــــیرر",
    "kir",
	"kos",
	"گوساله",
	"gosale",
	"gusale",
	"مادرتوگاییدم",
	"پدرتوگاییدم",
	"(ز*ن*ت*و*گ*ا*ی*ی*د*م)$",
	"کونی",
	"کله کیری",
	"گایید",
	"کسخل",
	"کس کج",
	"پیرسگ",
	"ننه قهوه",
	"مادری",
	"بیابخور",
	"عمتو ",
	"خواهرتو",
	"عمه ننه",
	"اب کون",
	"کیرم توت",
	"خرس",
	"پلشت",
	"اسکل",
	"OSKOL",
	"koskesh",
	"gaidam",
	"an",
	"عن",
	"fuck",
	"sag",
	"داشاق",
	"داشاغ",
	"سیکتر",
	"sikter",
	"khers",
	"nane ghahve",
	"madari",
	"nane ab kon",
	"کس لیس",
	"koslis",
	"چچچچچچچ",
	"تخم",
	"تخمم",
	"به کیرم",
	"به تخمم",
	"bk",
	"bt",
	"بیلاخ",
	"بیه",
	"بکن توت",
	"بکنت",
	"حرومزاده",
	"حرومی",
	
	},
  run = run
}
-- @Ernest_TM
