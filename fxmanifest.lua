-- ███████╗██╗███████╗██╗  ██╗ ██████╗███████╗
-- ██╔════╝██║██╔════╝██║ ██╔╝██╔════╝██╔════╝
-- █████╗  ██║███████╗█████╔╝ ██║     █████╗  
-- ██╔══╝  ██║╚════██║██╔═██╗ ██║     ██╔══╝  
-- ██║     ██║███████║██║  ██╗╚██████╗███████╗
-- ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚══════╝
-- Created By Fiskce [REDACTED]

-- } license = [REDACTED]
-- } support = [REDACTED]


--//=======================================================================================
--//                 Author:  @fiskce / @IcezDK	 	  Date: 10/12/2020                      
--//=======================================================================================
--//                                    serverscript                  	    
--//                                 Fiskce Anti Cheat                           
--//                             									                                        
--//=======================================================================================

fx_version 'bodacious'
game 'gta5'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "config/Config.lua",
    "server.lua",
}

client_scripts {
    "config/Config.lua",
    "client.lua",
}