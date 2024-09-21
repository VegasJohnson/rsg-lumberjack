Config = {}

-- debug
Config.Debug = false

-- settings
Config.StorageMaxWeight = 6000000
Config.StorageMaxSlots = 48

-- blip settings
Config.Blip = {
    blipName = 'Lumberjack', -- Config.Blip.blipName
    blipSprite = 2107754879, -- Config.Blip.blipSprite------------------------------------------------
    blipScale = 0.2 -- Config.Blip.blipScale
}

Config.TreeCraftingPoint = {

    {   -- Strawberry
        name = 'Strawberry Lumberjack Crafting',
        town = 459833523,
        prompt = 'lumberjack-1',
        job = 'sblumberjack',
        coords = vector3(-1821.3485, -425.0621, 160.0860), 
        showblip = true, 
        showmarker = false
    },
  --[[  {   -- Braccus			-- Needs Imap --
        name = 'Braccus St Lumberjack Crafting',
        town = 459833523,
        prompt = 'lumberjack-2',
        job = 'bslumberjack',
        coords = vector3(576.7336, 1683.1541, 187.9659), 
        showblip = true, 
        showmarker = false
    },]]
    {   -- Annsburg
        name = 'Annsburg Lumberjack Crafting',
        town = 459833523,
        prompt = 'lumberjack-3',
        job = 'annlumberjack',
        coords = vector3(2844.3064, 1357.8695, 64.9188), 
        showblip = true, 
        showmarker = false
    },
    {   -- Blackwater
        name = 'Blackwater Lumberjack Crafting',
        town = 459833523,
        prompt = 'lumberjack-4',
        job = 'bwlumberjack',
        coords = vector3(-866.2578, -1291.2087, 43.1012), 
        showblip = true, 
        showmarker = false
    },
}


Config.ComponetsCrafting = {
    
	['wood'] = {
        name = 'wood',
        lable = 'Wood Log',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'sap',  amount = 2 },
			[2] = { item = 'pulp',  amount = 5 },
        },
        receive = 'wood'
    },
    ['paper'] = {
        name = 'paper',
        lable = 'Paper',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'water',  amount = 1 },
			[2] = { item = 'pulp',  amount = 2 },
        },
        receive = 'paper'
    },
    ['aplank'] = {
        name = 'aplank',
        lable = 'Low Grade Plank',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
        },
        receive = 'aplank'
    },
    ['bplank'] = {
        name = 'bplank',
        lable = 'Med Grade Plank',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'wood',  amount = 2 },
            [2] = { item = 'sap',  amount = 3 },
        },
        receive = 'bplank'
    },
    ['cplank'] = {
        name = 'cplank',
        lable = 'High Grade Plank',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'wood',  amount = 5 },
            [2] = { item = 'sap',  amount = 5 },
        },
        receive = 'cplank'
    },
}

Config.ToolsCrafting = {
    ['canoe'] = {
        name = 'canoe',
        lable = 'Canoe',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'cplank',  amount = 10 },
        },
        receive = 'canoe'
    },
    ['campfire'] = {
        name = 'campfire',
        lable = 'Camp Fire',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'wood',  amount = 5 },
			[2] = { item = 'charcol',  amount = 4 },
            [3] = { item = 'paper',  amount = 1 },
        },
        receive = 'campfire'
    },
    ['moonbarrel'] = {
        name = 'moonbarrel',
        lable = 'Moonshine Barrel',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'bplank',  amount = 3 },
			[2] = { item = 'sap',  amount = 4 },
        },
        receive = 'moonbarrel'
    },
    ['cwagon'] = {
        name = 'cwagon',
        lable = 'Supply Bag',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'aplank',  amount = 1 },
			[2] = { item = 'sap',  amount = 10 },
            [3] = { item = 'poor_coyote_pelt', amount = 4 },
            [4] = { item = 'copper', amount = 4 },
        },
        receive = 'cwagon'
    },
    --[[ ['wagonwheel'] = {
        name = 'wagonwheel',
        lable = 'Wagon Wheel',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'aplank',  amount = 2 },
			[2] = { item = 'nails',  amount = 10 },
            [3] = { item = 'sap',  amount = 5 },
        },
        receive = 'wagonwheel'
    },]]
    ['tent'] = {
        name = 'tent',
        lable = 'Open Tent',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'wood',  amount = 2 },
			[2] = { item = 'poor_coyote_pelt',  amount = 3 },
        },
        receive = 'tent'
    },
    ['crate'] = {
        name = 'crate',
        lable = 'Storage Crate',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'aplank',  amount = 5 },
			[2] = { item = 'nails',  amount = 10 },
        },
        receive = 'crate'
    },
    ['shovelhandle'] = {
        name = 'shovelhandle',
        lable = 'Shovel Handle',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'aplank',  amount = 1 },
        },
        receive = 'shovelhandle'
    },
    ['axehandle'] = {
        name = 'axehandle',
        lable = 'Axe Handle',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'bplank',  amount = 1 },
        },
        receive = 'axehandle'
    },
    ['gunstalk'] = {
        name = 'gunstalk',
        lable = 'Gun Stock',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'cplank',  amount = 1 },
        },
        receive = 'gunstalk'
    },
    ['gunhandle'] = {
        name = 'gunhandle',
        lable = 'Gun Handle',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'cplank',  amount = 1 },
        },
        receive = 'gunhandle'
    },
    ['gunforend'] = {
        name = 'gunforend',
        lable = 'Gun Forend',
        crafttime = 20000,
        craftitems = {
            [1] = { item = 'cplank',  amount = 1 },
        },
        receive = 'gunforend'
    },
}
