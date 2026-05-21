local HIRED_HAND_TYPE = ENT_TYPE.CHAR_HIREDHAND

local tex_biden
local tex_trump

set_callback(function()

    local base = get_type(HIRED_HAND_TYPE)

    -- Biden
    local biden_def = get_texture_definition(base.texture)
    biden_def.texture_path = "sprites/biden.png"
    tex_biden = define_texture(biden_def)

    -- Trump
    local trump_def = get_texture_definition(base.texture)
    trump_def.texture_path = "sprites/trump.png"
    tex_trump = define_texture(trump_def)

end, ON.START)

set_post_entity_spawn(function(ent)

    if math.random(1,2) == 1 then
        ent:set_texture(tex_biden)
    else
        ent:set_texture(tex_trump)
    end

end, SPAWN_TYPE.ANY, MASK.PLAYER, HIRED_HAND_TYPE)