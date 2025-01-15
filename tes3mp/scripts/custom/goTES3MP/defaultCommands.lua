
-- Define the addKickPlayerCommand function
goTES3MP_Command.addCommandHandler(
    "kickplayer",
    "Kicks the specified player from the tes3mp server.",
    function(commandArgs)
        if goTES3MPModules["getPlayers"] ~= nil then
            local playerList = goTES3MPModules.getPlayers.getPlayers()
            goTES3MP_Command.sendDiscordSlashResponse(playerList, commandArgs)
        else
            goTES3MP_Command.sendDiscordSlashResponse("Module not found or loaded", commandArgs)
        end
    end
)

goTES3MP_Command.addCommandHandler(
    "runconsole",
    "Run a console command on a specific Player.",
    function(commandArgs)
        local username = commandArgs["username"]
        local consoleCommand = commandArgs["command"]
        local targetPid = goTES3MP_Command.getPlayerPID(username)
        
        if targetPid ~= nil then
            logicHandler.RunConsoleCommandOnPlayer(targetPid, consoleCommand)
            goTES3MP_Command.sendDiscordSlashResponse("Console command has been sent to the user", commandArgs)
        else
            goTES3MP_Command.sendDiscordSlashResponse("Player does not exist", commandArgs)
        end
    end,
    {
        {name = "username", description = "The name of the player.", required = true},
        {name = "command", description = "The console command to run.", required = true}
    }
)