-- ███████╗██╗███████╗██╗  ██╗ ██████╗███████╗
-- ██╔════╝██║██╔════╝██║ ██╔╝██╔════╝██╔════╝
-- █████╗  ██║███████╗█████╔╝ ██║     █████╗  
-- ██╔══╝  ██║╚════██║██╔═██╗ ██║     ██╔══╝  
-- ██║     ██║███████║██║  ██╗╚██████╗███████╗
-- ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚══════╝
-- Created By Fiskce [Redistribution is not allowed]

-- } license = [BERIFFA.GROUP.SHARED.LICENSE]
-- } support = [BERIFFA.COM/HELP-CENTER]

--//=======================================================================================
--//                 Author:  @fiskce / @IcezDK	 	  Date: 10/12/2020                      
--//=======================================================================================
--//                                    serverscript                  	    
--//                                 Fiskce Anti Cheat                           
--//                             									                                        
--//=======================================================================================
                                           


ConfigACC = {}

ConfigACC.Version = "v12.1 [BETA]" -- DONT TOUCH THIS! (if you change this the anticheat is not gonna work)

--// Default //--
ConfigACC.WeaponProtection = true -- Enable blacklisted weapons
ConfigACC.TriggersProtection = true -- Enable blacklisted events
ConfigACC.WordsProtection = true -- Enable blacklisted words
ConfigACC.BlacklistedCmd = true -- Enable blacklisted words
ConfigACC.GiveWeaponsProtection = false -- Enable give weapon
ConfigACC.ExplosionProtection = true -- Enable blacklisted explosions
ConfigACC.GiveWeaponAsPickupProtection = false -- Give Weapons as pickup


ConfigACC.AntiBlips = true -- Detecting people that are trying to use player blips
ConfigACC.AntiSpectate = true -- Detecting people that are trying to spectate people
ConfigACC.AntiESX = false -- Only enable this on vrp servers!

--// Webhook //-- SKIFT DIN WEBHOOK HER TIL DIN EGEN SERVER
ConfigACC.Discord = "" -- your discord invite link
ConfigACC.LogWebhook = "" -- your webhook here.


--// Custom //--
ConfigACC.ForceDiscord = false -- Forcing people to have fivem connected to discord (Highly Recommended because most of cheaters does not have fivem connected with discord)
ConfigACC.ForceDiscordMessage = "Discord is required to join this server."
ConfigACC.ForceDiscordConsoleLogs = true

ConfigACC.ForceSteam = true -- Forcing people to have steam open (Recommended for whitelisted servers)
ConfigACC.ForceSteamMessage = "Du skal have steam åbent. for at joine serveren."
ConfigACC.ForceSteamConsoleLogs = true

ConfigACC.AntiVPN = false -- Virker nogle gange
ConfigACC.AntiVPNMessage = "VPN er ikke tilladt på denne server for at undgå forfalskeri/snyd"
ConfigACC.AntiVPNDiscordLogs = true

ConfigACC.GlobalBan = false -- Virker ikke

ConfigACC.BanReason = "Du er blevet banned af FiskceAntiCheat, tænker du dette er en fejl, kontakt vores support på "..ConfigACC.Discord .. "" -- you can edit this uwu

ConfigACC.EjerToolBan = true -- for danish servers only.
 
ConfigACC.AntiAdminAbuse = true -- For VRP servere
ConfigACC.AntiAdminAbuseKickMessage = "AntiAdminAbuse is enabled"

ConfigACC.MaxWeaponAmmo = 251 -- max weapon ammo

ConfigACC.DisableAllWeapons = false -- removing all weapons from players

--// ClearPedTasksImmediately //--
ConfigACC.ClearPedTasksImmediatelyDetection = true -- Automatically detect ClearPedTasksImmediately (detect cheaters that are kicking out of vehicles other players) NEW!
ConfigACC.ClearPedTasksImmediatelyKick = false -- kick
ConfigACC.ClearPedTasksImmediatelyBan = true -- ban

--// Resource Stuff //--
ConfigACC.ResourceStopDetection = true -- banning people that are trying to stop client sided resources

--// Blacklisted Commands //--
ConfigACC.BlacklistedCommands = {
    "///",
	"/killmenu",
	"/dd"
}

--// Blacklisted Explosions //--
ConfigACC.BlockedExplosions = {
    0, -- Grenade
    1, -- GrenadeLauncher
    3, -- Molotov
    4, -- Rocket
    6, -- Hi_Octane
    15, -- Boat
    16, -- Ship_Destroy
    18, -- Bullet
    19, -- SmokeGrenadeLauncher
    20, -- SmokeGrenade
    22, -- Flare
    25, -- Programmablear
    26, -- Train
    27, -- Barrel
    28, -- PROPANE
    29, -- Blimp
    32, -- PlaneRocket
    33, -- VehicleBullet
    35, -- FireWork
    36, -- SnowBall
    37, -- ProxMine
    38, -- Valkyrie_Cannon
}

--// BlacklistedWords //--
ConfigACC.BlacklistedWords = {
    "Desudo",
	"Nigga",
	"ChocoHax",
	"WaveShield",
	"EulenCheats",
	"RedENGINE",
	"Neger",
	"N1gga",
	"Alokas",
	"HamMafia",
	"SkullExec",
	"DDOS",
	"ddos",
	
}

--// Blacklisted Weapons (FINALLY WORKS) //--
ConfigACC.BlacklistedWeapons = {
	"WEAPON_RAYPISTOL",
	"WEAPON_RAYCARBINE",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_FIREWORK",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_MINIGUN",
	"WEAPON_RAILGUN",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RAYMINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_PIPEBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_STICKYBOMB",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_COMBATMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_FLAREGUN",
}

--// Blacklisted Models //--
ConfigACC.BlacklistedModels = { -- Peds/Vehicles
	--VEHICLES
	"RHINO",
	"KHANJALI",
	"HUNTER",
	"CARGOBOB",
	"CARGOBOB2",
	"CARGOBOB3",
	"CARGOBOB4",
	"AKULA",
	"CHERNOBOG",
	"THRUSTER",
	"MINITANK",
	"APC",
	"DUMP",
	"LAZER",
	"JET",
	"HYDRA",
	"CARGOPLANE",
	"TITAN",
	"POLICE4",

	-- PEDS
	"s_m_y_swat_01",
	"u_m_y_zombie_01",
	"a_m_o_acult_01",
	"ig_wade",
	"s_m_y_hwaycop_01",
	"A_M_Y_ACult_01",
	"s_m_m_movalien_01",
	"s_m_m_movallien_01",
	"u_m_y_babyd",
	"CS_Orleans",
	"A_M_Y_ACult_01",
	"S_M_M_MovSpace_01",
	"U_M_Y_Zombie_01",
	"s_m_y_blackops_01",
	"a_f_y_topless_01",
	"a_c_boar",
	"a_c_cat_01",
	"a_c_chickenhawk",
	"a_c_chimp",
	"s_f_y_hooker_03",
	"a_c_chop",
	"a_c_cormorant",
	"a_c_cow",
	"a_c_coyote",
	"a_c_crow",
	"a_c_dolphin",
	"a_c_fish",
	"s_f_y_hooker_01",
	"a_c_hen",
	"a_c_humpback",
	"a_c_husky",
	"a_c_killerwhale",
	"a_c_mtlion",
	"a_c_pigeon",
	"a_c_poodle",
	"a_c_pug",
	"a_c_rabbit_01",
	"a_c_rat",
	"a_c_retriever",
	"a_c_rhesus",
	"a_c_rottweiler",
	"a_c_sharkhammer",
	"a_c_sharktiger",
	"a_c_shepherd",
	"a_c_stingray",
	"a_c_westy",
	"CS_Orleans",
	"p_crahsed_heli_s",
	"u_m_m_jesus_01",
	"u_m_y_imporage",
	"u_m_y_juggernaut_01",
	"mp_m_weapexp_01",
	"ig_chef2",
	"mp_m_bogdangoon",
	"a_m_y_hasjew_01",
}

--// Whitelisted Props //--
ConfigACC.WhitelistedProps = {
	"P_ld_stinger_s",
	"prop_barrier_work05",
	"prop_mp_barrier_02b",
	"prop_mp_cone_02",
	"P_ld_stinger_s",
	"prop_barrier_work05",
	"prop_mp_barrier_02b",
	"prop_mp_cone_02",
	"prop_notepad_01",
	"hei_prop_heist_box",
	"prop_single_rose",
	"prop_cs_ciggy_01",
	"hei_heist_sh_bong_01",
	"prop_ld_suitcase_01",
	"prop_security_case_01",
	"prop_police_id_board",
	"p_amb_coffeecup_01",
	"prop_drink_whisky",
	"prop_amb_beer_bottle",
	"prop_plastic_cup_02",
	"prop_amb_donut",
	"prop_cs_burger_01",
	"prop_sandwich_01",
	"prop_ecola_can",
	"prop_choc_ego",
	"prop_drink_redwine",
	"prop_champ_flute",
	"prop_drink_champ",
	"prop_cigar_02",
	"prop_cigar_01",
	"prop_acc_guitar_01",
	"prop_el_guitar_03",
	"prop_novel_01",
	"prop_snow_flower_02",
	"v_ilev_mr_rasberryclean",
	"p_michael_backpack_s",
	"p_amb_clipboard_01",
	"prop_tourist_map_01",
	"prop_beggers_sign_03",
	"prop_anim_cash_pile_01",
	"prop_pap_camera_01",
	"ba_prop_battle_champ_open",
	"p_cs_joint_02",
	"prop_amb_ciggy_01",
	"prop_ld_case_01",
	"prop_cs_tablet",
	"prop_npc_phone_02",
	"prop_sponge_01",
	"prop_ld_jerrycan_01",
}

--// Blacklisted Events //-- Husk og fjerne og adde events ;) Primært lavet til esx.
ConfigACC.BlacklistedEvents = {
	"esx_vehicleshop:setVehicleOwned",
	"esx_mafiajob:confiscatePlayerItem",
	"vrp_slotmachine:server:2",
	"Banca:deposit",
	"esx_jobs:caution",
	"give_back",
	"esx_fueldelivery:pay",
	"esx_carthief:pay",
	"esx_godirtyjob:pay",
	"esx_pizza:pay",
	"antilynx8:anticheat",
	"antilynxr6:detection",
	"esx_ranger:pay",
	"esx_garbagejob:pay",
	"esx_truckerjob:pay",
	"redst0nia:checking",
	"AdminMenu:giveBank",
	"AdminMenu:giveCash",
	"esx_gopostaljob:pay",
	"esx_banksecurity:pay",
	"esx_slotmachine:sv:2",
	"NB:recruterplayer",
	"esx_billing:sendBill",
	"esx_jailer:sendToJail",
	"esx_jail:sendToJail",
	"js:jailuser",
	"esx-qalle-jail:jailPlayer",
	"esx_dmvschool:pay", 
	"OG_cuffs:cuffCheckNearest",
	"CheckHandcuff",
	"cuffServer",
	"PICKUP_HEALTH_STANDARD",
	"cuffGranted",
	"police:cuffGranted",
	"esx_handcuffs:cuffing",
	"esx_policejob:handcuff",
	"esx_skin:responseSaveSkin",
	"esx_dmvschool:addLicense",
	"esx_mechanicjob:startCraft",
	"esx_drugs:startHarvestWeed",
	"esx_drugs:startTransformWeed",
	"esx_drugs:startSellWeed",
	"esx_drugs:startHarvestCoke",
	"esx_drugs:startTransformCoke",
	"esx_drugs:startSellCoke",
	"esx_drugs:startHarvestMeth",
	"esx_drugs:startTransformMeth",
	"esx_drugs:startSellMeth",
	"esx_drugs:startHarvestOpium",
	"esx_drugs:startSellOpium",
	"esx_drugs:startTransformOpium",
	"esx_blanchisseur:startWhitening",
	"esx_drugs:stopHarvestCoke",
	"esx_drugs:stopTransformCoke",
	"esx_drugs:stopSellCoke",
	"esx_drugs:stopHarvestMeth",
	"esx_drugs:stopTransformMeth",
	"esx_drugs:stopSellMeth",
	"esx_drugs:stopHarvestWeed",
	"esx_drugs:stopTransformWeed",
	"esx_drugs:stopSellWeed",
	"esx_drugs:stopHarvestOpium",
	"esx_drugs:stopTransformOpium",
	"esx_drugs:stopSellOpium",
	"esx_society:openBossMenu",
	"esx_jobs:caution",
	"esx_tankerjob:pay",
	"esx_vehicletrunk:giveDirty",
	"gambling:spend",
	"AdminMenu:giveDirtyMoney",
	"esx_moneywash:deposit",
	"esx_moneywash:withdraw",
	"mission:completed",
	"99kr-burglary:addMoney",
	"esx_jailer:unjailTime",
	"esx_ambulancejob:revive",
	"DiscordBot:playerDied",
	"hentailover:xdlol",
	"antilynx8:anticheat",
	"antilynxr6:detection",
	-- "esx:getSharedObject", -- anti injection!
	"esx_society:getOnlinePlayers",
	"antilynx8r4a:anticheat",
	"antilynxr4:detect",
	"js:jailuser", 
	"ynx8:anticheat",
	"lynx8:anticheat",
	"adminmenu:allowall",
	"h:xd",
	"ljail:jailplayer",
	"adminmenu:setsalary",
	"adminmenu:cashoutall",
	"paycheck:bonus",
	"HCheat:TempDisableDetection",
	"esx_drugs:pickedUpCannabis",
	"esx_drugs:processCannabis",
	"esx-qalle-hunting:reward",
	"esx-qalle-hunting:sell",
	"esx_mecanojob:onNPCJobCompleted",
	"BsCuff:Cuff696999",
	"esx_carthief:alertcops",
	"mellotrainer:adminTempBan",
	"mellotrainer:adminKick",
	"esx_society:putVehicleInGarage",
}
