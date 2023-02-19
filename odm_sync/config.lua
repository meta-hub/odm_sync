Config = {
    syncTime = true,            -- Should we sync time with all clients?
    syncDate = true,            -- Should we sync the date with all clients?
    syncWeather = true,         -- Should we sync weather with all clients?
    weatherChangeTime = 6000,   -- How long should it take to change weather type? (milliseconds?)

    weatherTypes = {
        "Announce",
        "Astronomy",
        "Clear",
        "Default_PHY",
        "FIG_07_Storm",
        "ForbiddenForest_01",
        "HighAltitudeOnly",
        "Intro_01",
        "LightClouds_01",
        "LightRain_01",
        "Misty_01",
        "MistyOvercast_01_",
        "MKT_Nov11",
        "Overcast_01",
        "Overcast_Heavy_01",
        "Overcast_Heavy_Winter_01",
        "Overcast_Windy_01",
        "Rainy",
        "Sanctuary_Bog",
        "Sanctuary_Coastal",
        "Sanctuary_Forest",
        "Sanctuary_Grasslands",
        "Snow_01",
        "Snow_Const",
        "SnowLight_01",
        "SnowShort",
        "Stormy_01",
        "StormyLarge_01",
        "TestStormShort",
        "WEA_TestWind",
        "Winter_Misty_01",
        "Winter_Overcast_01",
        "Winter_Overcast_Windy_01"        
    },

    autoWeatherCycles = {
        ["Stormy_01"] = "Rainy",
        ["Rainy"] = "Overcast_01"
    }
}