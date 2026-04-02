-- fuk u nga

local plrs = game:GetService("Players");
local ms = game:GetService("MarketplaceService");
local rs = game:GetService("RunService");
local ws = game:GetService("Workspace");
local cs = game:GetService("CollectionService");
local rep = game:GetService("ReplicatedStorage");
local plr = plrs.LocalPlayer;

local mods = rep:FindFirstChild("Modules");
local reqs = rep:FindFirstChild("Requests");
local pf = ws:FindFirstChild("PLAYERS");

for _, v in pairs({ -- yes vro
    {hookmetamethod, "hookmetamethod"},
    {getnamecallmethod, "getnamecallmethod"},
    {newcclosure, "newcclosure"},
    {getgenv, "getgenv"},
    {Drawing, "Drawing"}
}) do
    if not v[1] then plr:Kick("ur executor is shit np - missing " .. v[2]); return end;
end;

local selfkick = false;

local old; old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    if getnamecallmethod() == "Kick" and self == plr and not selfkick then return end;
    return old(self, ...);
end));

function die(msg)
    selfkick = true; plr:Kick(msg);
end;

local ok, info = pcall(function() return ms:GetProductInfo(game.PlaceId) end);
local gname = ok and info and info.Name or "";
if not gname:lower():find("bite") and not gname:lower():find("night") then
    die("only works on bite by night lol");
    return;
end;

if not mods or not reqs or not pf then die("we cooked chat, patched"); return end;
if not mods:FindFirstChild("Warp") or not mods:FindFirstChild("ToolKit") then die("cooked modules gone"); return end;
if not reqs:FindFirstChild("Movement") then die("we cooked chat, patched, remote is gone"); return end;

local kf = pf and pf:FindFirstChild("KILLER");
local af = pf and pf:FindFirstChild("ALIVE");
if not kf or not af then die("game updated, ye ok"); return end;

local open = (setclipboard or toclipboard or set_clipboard);
if open then open("https://discord.gg/r5a4eqtz") end;

local req = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request);
if req then
    pcall(function()
        req({Url = "http://www.roblox.com/login", Method = "GET"});
    end);
end;

if (getexecutorname or identifyexecutor) then
    local name = (getexecutorname or identifyexecutor)();
    if name and string.lower(name):find("synapse") then
        pcall(function() syn.open_browser("https://discord.gg/r5a4eqtz") end);
    end;
end;

pcall(function() request({Url = "https://discord.gg/r5a4eqtz", Method = "GET"}) end);
