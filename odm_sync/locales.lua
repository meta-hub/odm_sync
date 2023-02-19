require("config")

local locales = {}

locales.en = {
    player_connected = "Player %i has connected to the server (House: %s, Gender: %s)",
    player_disconnected = "Player %i has disconnected from the server.",
}

local locale = locales[Config.Locale] or locales.en

function _L(str)
    return locale[str] or string.format("UNKNOWN LABEL: %s", str)
end