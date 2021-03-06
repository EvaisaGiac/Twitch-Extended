dofile_once("data/scripts/lib/utilities.lua")

local projectile = GetUpdatedEntityID()

local comps = EntityGetComponent( projectile, "ProjectileComponent" )
	
if( comps ~= nil ) then
    for i,comp in ipairs(comps) do
      --[[  local damage = ComponentGetValue2( comp, "damage" )
        damage = damage * 4.0
        ComponentSetValue2( comp, "damage", damage )
        
        local dtypes = { "projectile", "explosion", "melee", "ice", "slice", "electricity", "radioactive", "drill", "fire" }
        for a,b in ipairs(dtypes) do
            local v = tonumber(ComponentObjectGetValue( comp, "damage_by_type", b ))
            v = v * 4.0
            ComponentObjectSetValue( comp, "damage_by_type", b, tostring(v) )
        end
        
        local etypes = { "explosion_radius", "ray_energy", "damage" }
        for a,b in ipairs(etypes) do
            local v = tonumber(ComponentObjectGetValue( comp, "config_explosion", b ))
            v = v * 4.0
            ComponentObjectSetValue( comp, "config_explosion", b, tostring(v) )
        end
        ]]

        ComponentSetValue2(comp, "on_death_explode", true)
        ComponentSetValue2(comp, "on_lifetime_out_explode", true)

        ComponentObjectSetValue2(comp, "config_explosion", "hole_enabled", true)  
        ComponentObjectSetValue2(comp, "config_explosion", "damage_mortals", true)  
        ComponentObjectSetValue2(comp, "config_explosion", "explosion_sprite", "data/particles/explosion_012.xml")  
        ComponentObjectSetValue2(comp, "config_explosion", "explosion_sprite_lifetime", 0)  
        ComponentObjectSetValue2(comp, "config_explosion", "load_this_entity", "data/entities/particles/particle_explosion/main_small.xml")  
        local value =  5
        local current_radius = ComponentObjectGetValue2(comp, "config_explosion", "explosion_radius")
        if(tonumber(current_radius) < tonumber(value))then
            ComponentObjectSetValue2(comp, "config_explosion", "explosion_radius", value)   
        end

        value = 2
        local current_damage = ComponentObjectGetValue2(comp, "config_explosion", "damage")
        if(tonumber(current_damage) < tonumber(value))then
            ComponentObjectSetValue2(comp, "config_explosion", "damage", value)   
        end

        value =  1.5
        local current_radius = ComponentObjectGetValue2(comp, "config_explosion", "explosion_radius")
        ComponentObjectSetValue2(comp, "config_explosion", "explosion_radius", current_radius * value)  
    end
end


--[[
    			ComponentSetValue(projectileComponent, "on_death_explode", "1")
			ComponentSetValue(projectileComponent, "on_collision_die", "1")
			ComponentSetValue(projectileComponent, "on_lifetime_out_explode", "1")
			ComponentObjectSetValue(projectileComponent, "config_explosion", "hole_enabled", 1)  
			ComponentObjectSetValue(projectileComponent, "config_explosion", "damage_mortals", 1)  
			ComponentObjectSetValue(projectileComponent, "config_explosion", "explosion_sprite", "data/particles/explosion_012.xml")  
			ComponentObjectSetValue(projectileComponent, "config_explosion", "explosion_sprite_lifetime", "0")  
			ComponentObjectSetValue(projectileComponent, "config_explosion", "load_this_entity", "data/entities/particles/particle_explosion/main_small.xml")  
			local value =  5
			local current_radius = tonumber(ComponentObjectGetValue(projectileComponent, "config_explosion", "explosion_radius"))
			if(tonumber(current_radius) < tonumber(value))then
				ComponentObjectSetValue(projectileComponent, "config_explosion", "explosion_radius", value)   
			end

			value = 2
			local current_damage = tonumber(ComponentObjectGetValue(projectileComponent, "config_explosion", "damage"))
			if(tonumber(current_damage) < tonumber(value))then
				ComponentObjectSetValue(projectileComponent, "config_explosion", "damage", value)   
			end

			value =  1.5
			local current_radius = tonumber(ComponentObjectGetValue(projectileComponent, "config_explosion", "explosion_radius"))
			ComponentObjectSetValue(projectileComponent, "config_explosion", "explosion_radius", tostring(current_radius * value))   

]]