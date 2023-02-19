require("config")
require("locales")

local curDate = os.date("*t")
local curWeather = Config.weatherTypes[1]

local totalTime = 0
local prevWeatherChange = 0

local function setWorldTime(hour, minute)
    world.hour = hour
    world.minute = minute
end

local function setWorldDate(day, month, year)
    world.day = day
    world.month = month
    world.year = year
end

local function setWorldWeather(weather)
    world.weather = weather

    print("World weather set: " .. weather)
end

local function syncWorld()
    world:RpcSet()
end

registerForEvent("init", function()
    if Config.syncTime then
        setWorldTime(curDate.hour, curDate.min)
    end

    if Config.syncDate then
        setWorldDate(curDate.day, curDate.month, curDate.year)
    end

    if Config.syncWeather then
        setWorldWeather(curWeather)
    end

    if Config.syncTime 
    or Config.syncDate
    or Config.syncWeather 
    then
        syncWorld()
    end
end)

local function handleTimeTick(date)
    if curDate.hour ~= date.hour or curDate.min ~= date.min then
        setWorldTime(curDate.hour, curDate.min)

        return true
    end

    return false
end

local function handleDateTick(date)
    if curDate.day ~= date.day or curDate.month ~= date.month or curDate.year ~= date.year then
        setWorldDate(curDate.day, curDate.month, curDate.year)

        return true
    end

    return false
end

local function handleWeatherTick()
    if totalTime - prevWeatherChange >= Config.weatherChangeTime then
        if Config.autoWeatherCycles[curWeather] then
            curWeather = Config.autoWeatherCycles[curWeather]
        else
            curWeather = Config.weatherTypes[math.random(#Config.weatherTypes)]
        end

        setWorldWeather(curWeather)

        prevWeatherChange = totalTime

        return true
    end

    return false
end

registerForEvent("update", function(time)
    local doSync = false
    local date = os.date("*t")

    if Config.syncTime then
        if handleTimeTick(date) then
            doSync = true
        end
    end

    if Config.syncDate then
        if handleDateTick(date) then
            doSync = true
        end
    end

    if Config.syncWeather then
        if handleWeatherTick() then
            doSync = true
        end
    end

    if doSync then
        syncWorld()
    end

    totalTime = totalTime + time
end)

registerForEvent("player_joined", function()
    syncWorld()
end)