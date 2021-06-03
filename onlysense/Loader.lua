red     = Color3.fromRGB(255, 255, 255)
green   = Color3.new(0, 1, 0.498039)
yellow  = Color3.new(1, 1, 0.498039)


game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[xiba]: Welcome to onlysense!";
    Font = Enum.Font.Code;
    Color = Color3.fromRGB(199, 218, 233);
})

local loader = {}
loader.games = {}
function loader:registerGame(id, name, url)
	loader.games[tostring(id)] = {name = name, loadstring = url}
end

function loader:detectGame()
	local detectedGame = self.games[tostring(game.PlaceId)]
	
	if detectedGame then
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "Supported Game!",
        Font = Enum.Font.Code,
		Color = green,
	})
		return detectedGame
	else
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "Game Not supported, loaded universal!",
        Font = Enum.Font.Code,
		Color = red,
	})
    loadstring(game:HttpGet"https://xiba.uno/onlysense/Games/Universal.lua")()
	end
end
a="https://xiba.uno/onlysense/Games"
loader:registerGame(286090429, "Arsenal", a.."/Arsenal.lua")
loader:registerGame(3527629287, "Big Paintball", a.."/BigPaintball.lua")
loader:registerGame(183364845, "Speedrun 4", a.."/Speedrun4.lua")

local detectedGame = loader:detectGame()

if detectedGame then
if not ({pcall(function()
			local Elements = {"Line", "Text", "Image", "Circle", "Square", "Quad", "Triangle"}
			for i, v in ipairs(Elements) do
				Drawing.new(v):Remove()
			end
		end)})[1] then
		
		Drawing = nil
	end
	loadstring(game:HttpGet(detectedGame.loadstring))()
end
