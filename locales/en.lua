local Translations = {
    error = {
        you_are_not_authorised = 'you are not authorised!',
        you_must_be_holding_weapon = 'you must be holding the weapon!',
        you_dont_have_the_required_items = "You don\'t have the required items!",
        you_dont_have_this_blueprint_original = "you don\'t have this blueprint original",
        need_more_crafting_items = 'need more crafting items!',
        you_dont_have_enough_cash_to_do_that = 'you don\'t have enough cash to do that!',
        not_enough_reputation_repneeded_required = 'not enough reputation %{repneeded} required!',
    },
    success = {
        weapon_cleaned = 'weapon cleaned',
        crafting_finished = 'crafting finished',
    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        open = 'Open ',
        weapon_crafting = 'Weapon Crafting',
        weapon_parts_crafting = 'Crafting',
        weaponsmith_storage = 'Weaponsmith Storage',
        job_management = 'Job Management',
        close_menu = '>> Close Menu <<',
        revolver_crafting = 'Revolver Crafting',
        pistol_crafting = 'Pistol Crafting',
        repeater_crafting = 'Repeater Crafting',
        rifle_crafting = 'Rifle Crafting',
        shotgun_crafting = 'Shotgun Crafting',
		weaponsmith_customize = 'Customize Weapon',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        crafting_a = 'Crafting a ',
    },
    text = {
        var = 'text goes here',
    },
    progressbar = {
      making_copy_of = 'Making a copy of ',
      copy = 'copy-',
      crafting_washkit = 'Crafting a Wash Bucket..',
      crafting_shovel = 'Crafting a Shovel..',
      crafting_axe= 'Crafting a Axe..',
      crafting_pickAxe = 'Crafting a PickAxe..',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
