local Discordia = require("discordia")

local Client = Discordia.Client()

_G.Client = Client

local Handler = require("Command"):Init(Client)

local PingCommand = Handler.New()
PingCommand:SetName("ping")
PingCommand:SetMinPerm("Owner")
PingCommand:SetFunction(function(MSG, Args, Raw)
    MSG:reply("Pong! <:hotcomputer:685867382073196712>")
end)

local ChickenCommand = Handler.New()
ChickenCommand:SetName("chicken")
ChickenCommand:SetFunction(function(MSG, Args, Raw)

	local PossibleMessages = {"Here you go have some chicken!", "Not for you!", "Got A Bucket O Chicken", "NOM NOM NOM", "C H I C K E N"}

    MSG:reply({content = PossibleMessages[math.random(1, #PossibleMessages)],
	embed = {image = {url = "https://i.pinimg.com/originals/e8/36/7a/e8367a927b1859ea50028a031ea4b996.png"}}})
end)

local FeatherCommand = Handler.New()
FeatherCommand:SetName("feather")
FeatherCommand:SetFunction(function(MSG, Args, Raw)
    MSG:reply("You have **" .. math.random(0, 1000) .. "** Feathers! <:tf2chicken:774704830060429313>")
end)

local BonkCommand = Handler.New()
BonkCommand:SetName("bonk")
BonkCommand:SetFunction(function(MSG, Args, Raw)
    MSG:reply("https://33.media.tumblr.com/e8bbd2144cfd5ad9b022c02e4eb205e9/tumblr_njsou9DxeB1tjsfjuo1_500.gif")
end)

local InfoCommand = Handler.New()
InfoCommand:SetName("info")
InfoCommand:SetFunction(function(MSG, Args, Raw)
    MSG:reply(
        {
            content = MSG.author.mentionString, embed = {
                title = "Chicken-Bot",
                description = "C H I C K E N\nA bot created just for fun\n!Chicken\n!Feather\n!bonk\n\nCreated by [**CoreByte#1161**](https://discord.com/channels/@me/533536581055938580)\nView [**source code**](https://github.com/CoreBytee/ChickenBot)\nJoin [**Cubic Inc.**](http://cubicdiscord.ga)",

								author = {
									name = "Part of cubic inc",
									icon_url = "https://cdn.discordapp.com/attachments/762660805534679050/762661612372099072/Logo_Smaller_can.png"
								}
            }
        }
    )
end)

Client:on("ready", function()
    Client:setGame({name = "C H I C K E N | !info", type = 0})
end)

local http = require('http')



http.createServer(function (req, res)
  local body = "Hello world\n"
  res:setHeader("Content-Type", "text/plain")
  res:setHeader("Content-Length", #body)
  res:finish(body)
end):listen(3030, '0.0.0.0')

local Token = require("./Tokens").Token or os.getenv("TOKEN")

Client:run("Bot " .. Token)
