local HIRED_HAND_TYPE = ENT_TYPE.MONS_HIREDHAND

-- We use a flag to load textures once, only after the game is ready
local textures_loaded = false
local tex_biden = -1
local tex_trump = -1

set_callback(function()
    if not textures_loaded and HIRED_HAND_TYPE ~= nil then
        local base_type = get_type(HIRED_HAND_TYPE)
        
        -- Biden Setup
        local biden_def = get_texture_definition(base_type.texture)
        biden_def.texture_path = "sprites/hired_help_biden.png"
        tex_biden = define_texture(biden_def)
        
        -- Trump Setup
        local trump_def = get_texture_definition(base_type.texture)
        trump_def.texture_path = "sprites/hired_help_trump.png"
        tex_trump = define_texture(trump_def)
        
        textures_loaded = true
    end
end, ON.GAME_START)

set_callback(function(entity)
    if textures_loaded then
        local choice = prng:random(1, 2)
        if choice == 1 then
            entity:set_texture(tex_biden)
        else
            entity:set_texture(tex_trump)
        end
    end
end, ON.ENTITY_INITIALIZE, HIRED_HAND_TYPE)