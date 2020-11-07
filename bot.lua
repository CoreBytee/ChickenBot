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

ChickenCommand = Handler.New()
ChickenCommand:SetName("chicken")
ChickenCommand:SetFunction(function(MSG, Args, Raw)
    MSG:reply("Here you go have some chicken!\nhttps://i.pinimg.com/originals/e8/36/7a/e8367a927b1859ea50028a031ea4b996.png")
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