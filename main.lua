local init_done = false
local texture_biden = -1
local texture_trump = -1

local HIRED_HELP_TYPE = ENT_TYPE.MONS_HIREDHELP

set_callback(function(entity)
    -- Run this only once when the very first Hired Help spawns.
    -- We steal the Hired Help's default texture ID to use as a perfectly-sized template.
    if not init_done then
        local biden_def = get_texture_definition(entity.texture)
        biden_def.texture_path = "sprites/hired_help_biden.png"
        texture_biden = define_texture(biden_def)

        local trump_def = get_texture_definition(entity.texture)
        trump_def.texture_path = "sprites/hired_help_trump.png"
        texture_trump = define_texture(trump_def)
        
        init_done = true
    end
    
    -- Generate a random number: 1 or 2
    local choice = prng:random(1, 2)
    
    -- Use the set_texture() method to apply the newly generated texture ID
    if choice == 1 then
        entity:set_texture(texture_biden)
    else
        entity:set_texture(texture_trump)
    end
end, ON.ENTITY_INITIALIZE, HIRED_HELP_TYPE)