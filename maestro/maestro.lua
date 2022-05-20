--[[
* 	Maestro 1.0.0 by Piellar
* 	May 20th 2022
*
*	Everyone is permitted to copy and distribute verbatim or modified copies of this
*	license document, and changing it is allowed as long as the name is changed and
*	you neither claim nor imply it or the associated code to be your original work.
]]--

_addon.author = 'Piellar'
_addon.name = 'Maestro'
_addon.version = '1.0.0'

require 'common'

------------------------------------------------------------------------------------------------------
-- List of available songs in the FFXI Client
-- Songs that aren't in this list will be ignored when used in settings.json
--
-- Credit for this list goes to Seth VanHeulen and Shinzaku, taken from their addon SetBGM
------------------------------------------------------------------------------------------------------
local configfile = '/settings.json';
local songs = {
	[40]='Cloister of Time and Souls',
	[41]='Royal Wanderlust',
	[42]='Snowdrift Waltz',
	[43]='Troubled Shadows',
	[44]='Where Lords Rule Not',
	[45]='Summers Lost',
	[46]='Goddess Divine',
	[47]='Echoes of Creation',
	[48]='Main Theme',
	[49]='Luck of the Mog',
	[50]='Feast of the Ladies',
	[51]='Abyssea - Scarlet Skies, Shadowed Plains',
	[52]='Melodies Errant',
	[53]='Shinryu',
	[54]='Everlasting Bonds',
	[55]='Provenance Watcher',
	[56]='Where it All Begins',
	[57]='Steel Sings, Blades Dance',
	[58]='A New Direction',
	[59]='The Pioneers',
	[60]='Into Lands Primeval - Ulbuka',
	[61]="Water's Umbral Knell",
	[62]='Keepers of the Wild',
	[63]='The Sacred City of Adoulin',
	[64]='Breaking Ground',
	[65]='Hades',
	[66]='Arciela',
	[67]='Mog Resort',
	[68]='Worlds Away',
	[69]="Distant Worlds (Nanaa Mihgo's version)",
	[70]='Monstrosity',
	[71]="The Pioneers (Nanaa Mihgo's version)",
	[72]='The Serpentine Labyrinth',
	[73]='The Divine',
	[74]='Clouds Over Ulbuka',
	[75]='The Price',
	[76]='Forever Today',
	[77]='Distant Worlds (Instrumental)',
	[78]='Forever Today (Instrumental)',
	[79]='Iroha',
	[80]='The Boundless Black',
	[81]='Isle of the Gods',
	[82]='Wail of the Void',
	[83]="Rhapsodies of Vana'diel",
	[84]="Mount (Ability)",
	[85]="Ambuscade",
	[86]='Awakening (FFRK)',
	[87]='Omen - Unknown Track Title',
	[88]='Dynamis Divergence - Unknown Track Title',
	[89]='Dynamis Divergence - Unknown Track Title',
	[101]='Battle Theme',
	[102]='Battle in the Dungeon #2',
	[103]='Battle Theme #2',
	[104]='A Road Once Traveled',
	[105]='Mhaura',
	[106]='Voyager',
	[107]="The Kingdom of San d'Oria",
	[108]="Vana'diel March",
	[109]='Ronfaure',
	[110]='The Grand Duchy of Jeuno',
	[111]='Blackout',
	[112]='Selbina',
	[113]='Sarutabaruta',
	[114]='Batallia Downs',
	[115]='Battle in the Dungeon',
	[116]='Gustaberg',
	[117]="Ru'Lude Gardens",
	[118]='Rolanberry Fields',
	[119]='Awakening',
	[120]="Vana'diel March #2",
	[121]='Shadow Lord',
	[122]='One Last Time',
	[123]='Hopelessness',
	[124]='Recollection',
	[125]='Tough Battle',
	[126]='Mog House',
	[127]='Anxiety',
	[128]='Airship',
	[129]='Hook, Line and Sinker',
	[130]='Tarutaru Female',
	[131]='Elvaan Female',
	[132]='Elvaan Male',
	[133]='Hume Male',
	[134]='Yuhtunga Jungle',
	[135]='Kazham',
	[136]='The Big One',
	[137]='A Realm of Emptiness',
	[138]="Mercenaries' Delight",
	[139]='Delve',
	[140]='Wings of the Goddess',
	[141]='The Cosmic Wheel',
	[142]='Fated Strife -Besieged-',
	[143]='Hellriders',
	[144]='Rapid Onslaught -Assault-',
	[145]='Encampment Dreams',
	[146]='The Colosseum',
	[147]='Eastward Bound...',
	[148]='Forbidden Seal',
	[149]='Jeweled Boughs',
	[150]='Ululations from Beyond',
	[151]='The Federation of Windurst',
	[152]='The Republic of Bastok',
	[153]='Prelude',
	[154]='Metalworks',
	[155]='Castle Zvahl',
	[156]="Chateau d'Oraguille",
	[157]='Fury',
	[158]='Sauromugue Champaign',
	[159]='Sorrow',
	[160]='Repression (Memoro de la Stono)',
	[161]='Despair (Memoro de la Stono)',
	[162]='Heavens Tower',
	[163]='Sometime, Somewhere',
	[164]='Xarcabard',
	[165]='Galka',
	[166]='Mithra',
	[167]='Tarutaru Male',
	[168]='Hume Female',
	[169]='Regeneracy',
	[170]='Buccaneers',
	[171]='Altepa Desert',
	[172]='Black Coffin',
	[173]='Illusions in the Mist',
	[174]='Whispers of the Gods',
	[175]="Bandits' Market",
	[176]='Circuit de Chocobo',
	[177]='Run Chocobo, Run!',
	[178]='Bustle of the Capital',
	[179]="Vana'diel March #4",
	[180]='Thunder of the March',
	[181]='Dash de Chocobo (Low Quality)',
	[182]='Stargazing',
	[183]="A Puppet's Slumber",
	[184]='Eternal Gravestone',
	[185]='Ever-Turning Wheels',
	[186]='Iron Colossus',
	[187]='Ragnarok',
	[188]='Choc-a-bye Baby',
	[189]='An Invisible Crown',
	[190]="The Sanctuary of Zi'Tah",
	[191]='Battle Theme #3',
	[192]='Battle in the Dungeon #3',
	[193]='Tough Battle #2',
	[194]='Bloody Promises',
	[195]='Belief',
	[196]='Fighters of the Crystal',
	[197]='To the Heavens',
	[198]="Eald'narche",
	[199]="Grav'iton",
	[200]='Hidden Truths',
	[201]='End Theme',
	[202]='Moongate (Memoro de la Stono)',
	[203]='Ancient Verse of Uggalepih',
	[204]="Ancient Verse of Ro'Maeve",
	[205]='Ancient Verse of Altepa',
	[206]='Revenant Maiden',
	[207]="Ve'Lugannon Palace",
	[208]='Rabao',
	[209]='Norg',
	[210]="Tu'Lia",
	[211]="Ro'Maeve",
	[212]='Dash de Chocobo',
	[213]='Hall of the Gods',
	[214]='Eternal Oath',
	[215]='Clash of Standards',
	[216]='On this Blade',
	[217]='Kindred Cry',
	[218]='Depths of the Soul',
	[219]='Onslaught',
	[220]='Turmoil',
	[221]='Moblin Menagerie - Movalpolos',
	[222]='Faded Memories - Promyvion',
	[223]='Conflict: March of the Hero',
	[224]='Dusk and Dawn',
	[225]="Words Unspoken - Pso'Xja",
	[226]='Conflict: You Want to Live Forever?',
	[227]='Sunbreeze Shuffle',
	[228]="Gates of Paradise - The Garden of Ru'Hmet",
	[229]='Currents of Time',
	[230]='A New Horizon - Tavnazian Archipelago',
	[231]='Celestial Thunder',
	[232]='The Ruler of the Skies',
	[233]="The Celestial Capital - Al'Taieu",
	[234]='Happily Ever After',
	[235]='First Ode: Nocturne of the Gods',
	[236]='Fourth Ode: Clouded Dawn',
	[237]='Third Ode: Memoria de la Stona',
	[238]='A New Morning',
	[239]='Jeuno -Starlight Celebration-',
	[240]='Second Ode: Distant Promises',
	[241]='Fifth Ode: A Time for Prayer',
	[242]='Unity',
	[243]="Grav'iton",
	[244]='Revenant Maiden',
	[245]='The Forgotten City - Tavnazian Safehold',
	[246]='March of the Allied Forces',
	[247]='Roar of the Battle Drums',
	[248]='Young Griffons in Flight',
	[249]='Run Maggot, Run!',
	[250]='Under a Clouded Moon',
	[251]='Autumn Footfalls',
	[252]='Flowers on the Battlefield',
	[253]='Echoes of a Zephyr',
	[254]='Griffons Never Die',
	[900]='Distant Worlds'
}

----------------------------------------------------------------------------------------------------
-- Variables
----------------------------------------------------------------------------------------------------
local default_config	=
{
    announceBGM	=	true,
	zoneBGM		=	{}
};
local config = default_config;

---------------------------------------------------------------------------------------------------
-- func: load
-- desc: Called when our addon is loaded.
---------------------------------------------------------------------------------------------------
ashita.register_event('load', function()
    -- Load the configuration file
    config = ashita.settings.load_merged(_addon.path .. configfile, config);
	
	-- The user is informed of certain settings
	print(string.format('\31\200[\30\82Maestro\31\200] \30\02%i zones \31\130will use a personalized background music.', table.count(config.zoneBGM)));
	if (config.announceBGM == false) then
		print('\31\200[\30\82Maestro\31\200]\31\130 Maestro \30\68will not announce BGM swaps\31\130.');
	end
end);

---------------------------------------------------------------------------------------------------
-- func: incoming_packet
-- desc: Called when our addon receives an incoming packet.
---------------------------------------------------------------------------------------------------
ashita.register_event('incoming_packet', function(id, size, data)
    -- Zone Change Packet
    if (id == 0x00A) then
		-- Fetch songs for the zoneID sent with the packet
		local zoneID = struct.unpack('H', data, 0x30 + 1);
		if (config.zoneBGM[tostring(zoneID)] ~= nil) then
			local packet = data:totable();
			-- Set field song, if any is configured
			local fieldSongID = config.zoneBGM[tostring(zoneID)].fieldSongID;
			if((fieldSongID ~= nil) and (songs[fieldSongID] ~= nil)) then
				if(config.announceBGM) then
					print(string.format('\31\200[\30\82Maestro\31\200]\31\130 Field theme: \30\70%s', songs[fieldSongID]));
				end
				packet[0x56 + 1] = math.fmod(fieldSongID, 256);
				packet[0x57 + 1] = math.floor(fieldSongID / 256);
				packet[0x58 + 1] = math.fmod(fieldSongID, 256);
				packet[0x59 + 1] = math.floor(fieldSongID / 256);
			end
			-- Set field song, if any is configured
			local battleSongID = config.zoneBGM[tostring(zoneID)].battleSongID;
			if((battleSongID ~= nil) and (songs[battleSongID] ~= nil)) then
				if(config.announceBGM) then
					print(string.format('\31\200[\30\82Maestro\31\200]\31\130 Battle theme: \30\70%s', songs[battleSongID]));
				end
				packet[0x5A + 1] = math.fmod(battleSongID, 256);
				packet[0x5B + 1] = math.floor(battleSongID / 256);
				packet[0x5C + 1] = math.fmod(battleSongID, 256);
				packet[0x5D + 1] = math.floor(battleSongID / 256);
			end
			return packet;
		end
    end
	return false;
end);

----------------------------------------------------------------------------------------------------
-- func: print_help
-- desc: Displays a help block for proper command usage.
-- credit: FPS addon by atom0s
----------------------------------------------------------------------------------------------------
local function print_help(cmd, help)
    -- Print the invalid format header..
    print('\31\200[\31\05' .. _addon.name .. '\31\200]\30\01 ' .. '\30\68Invalid format for command:\30\02 ' .. cmd .. '\30\01'); 

    -- Loop and print the help commands..
    for k, v in pairs(help) do
        print('\31\200[\31\05' .. _addon.name .. '\31\200]\30\01 ' .. '\30\68Syntax:\30\02 ' .. v[1] .. '\30\71 ' .. v[2]);
    end
end

----------------------------------------------------------------------------------------------------
-- func: command
-- desc: Event called when a command was entered.
----------------------------------------------------------------------------------------------------
ashita.register_event('command', function(command, ntype)
    -- Get the arguments of the command..
    local args = command:args();
    if (args[1] ~= '/maestro') then
        return false;
    end
	
    -- Toggles announcement in chat of BGM swaps
    if (args[2] == 'announce') then
        config.announceBGM = not config.announceBGM;
		if(config.announceBGM) then
			print('\31\200[\30\82Maestro\31\200]\31\130 Maestro \30\02will announce BGM swaps\31\130.');
		else
			print('\31\200[\30\82Maestro\31\200]\31\130 Maestro \30\68will not announce BGM swaps\31\130.');
		end
        return true;
    end

    -- Prints the addon help
    print_help('/maestro', {
        { '/maestro announce', '- Toggles chat announcements of BGM swaps' }
    });
    return true;
end);
