# Gamesense Lua API Documentation

## client

### `client.set_event_callback(event_name, callback)`
> Raises an error and prints a message in console upon failure.

**Arguments:**
- `event_name`: Name of the event.
- `callback`: Lua function to call when this event occurs.

---

### `client.unset_event_callback(event_name, callback)`
> Removes a callback that was previously set using set_event_callback

**Arguments:**
- `event_name`: Name of the event
- `callback`: Lua function that was passed to set_event_callback

---

### `client.log(msg, ...)`
**Arguments:**
- `msg`: The message
- `...`: Optional comma-separated arguments to concatenate with msg.

---

### `client.color_log(r, g, b, msg, ...)`
**Arguments:**
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `msg`: The message
- `...`: Optional comma-separated arguments to concatenate with msg.

---

### `client.error_log(msg)`
**Arguments:**
- `msg`: The error message

---

### `client.exec(cmd, ...)`
**Arguments:**
- `cmd`: The console command(s) to execute.
- `...`: Optional comma-separated arguments to concatenate with cmd.

---

### `client.userid_to_entindex(userid)`
> Returns the entity index, or 0 on failure.

**Arguments:**
- `userid`: This is given by some game events.

---

### `client.draw_debug_text(x, y, z, line_offset, duration, r, g, b, a, ...)`
> Avoid calling this during the paint event.

**Arguments:**
- `x`: Position in world space
- `y`: Position in world space
- `z`: Position in world space
- `line_offset`: Used for vertical alignment, use 0 for the first line.
- `duration`: Time in seconds that the text will remain on the screen.
- `r`: Red (1-255)
- `g`: Green (1-255)
- `b`: Blue (1-255)
- `a`: Alpha (1-255)
- `...`: The text that will be drawn

---

### `client.draw_hitboxes(entindex, duration, hitboxes, r, g, b, a, tick)`
> Draws hitbox overlays. Avoid calling this during the paint event.

**Arguments:**
- `entindex`: Entity index
- `duration`: Time in seconds
- `hitboxes`: Either the hitbox index, an array of hitbox indices, or 19 for all hitboxes
- `r`: Red (1-255)
- `g`: Green (1-255)
- `b`: Blue (1-255)
- `a`: Alpha (1-255)
- `tick`: Optional integer

---

### `client.random_int(minimum, maximum)`
> Returns a random integer between minimum and maximum.

**Arguments:**
- `minimum`: Lowest possible result
- `maximum`: Highest possible result

---

### `client.random_float(minimum, maximum)`
> Returns a random float between minimum and maximum.

**Arguments:**
- `minimum`: Lowest possible result
- `maximum`: Highest possible result

---

### `client.screen_size()`
> Returns (width, height).


---

### `client.visible(x, y, z)`
> Returns true if the position is visible. For example, you could use a player's origin to see if they are visible.

**Arguments:**
- `x`: Position in world space
- `y`: Position in world space
- `z`: Position in world space

---

### `client.trace_line(skip_entindex, from_x, from_y, from_z, to_x, to_y, to_z)`
> Returns fraction, entindex. fraction is a percentage in the range [0.0, 1.0] that tells you how far the trace went before hitting something, so 1.0 means nothing was hit. entindex is the entity index that hit, or -1 if no entity was hit.

**Arguments:**
- `skip_entindex`: Ignore this entity while tracing
- `from_x`: Position in world space
- `from_y`: Position in world space
- `from_z`: Position in world space
- `to_x`: Position in world space
- `to_y`: Position in world space
- `to_z`: Position in world space

---

### `client.trace_bullet(from_player, from_x, from_y, from_z, to_x, to_y, to_z, skip_players)`
> Returns entindex, damage. Entindex is nil when no player is hit or if players are skipped.

**Arguments:**
- `from_player`: Entity index of the player whose weapon will be used for this trace
- `from_x`: Position in world space
- `from_y`: Position in world space
- `from_z`: Position in world space
- `to_x`: Position in world space
- `to_y`: Position in world space
- `to_z`: Position in world space
- `skip_players`: Optional, pass true to skip expensive hitbox checks.

---

### `client.scale_damage(entindex, hitgroup, damage)`
> Returns adjusted damage for the specified hitgroup

**Arguments:**
- `entindex`: Player entity index
- `hitgroup`: Hit group index
- `damage`: Damage

---

### `client.delay_call(delay, callback, ...)`
**Arguments:**
- `delay`: Time in seconds to wait before calling callback.
- `callback`: The lua function that will be called after delay seconds.
- `...`: Optional arguments that will be passed to the callback.

---

### `client.latency()`
> Returns your latency in seconds.


---

### `client.camera_angles()`
> Returns pitch, yaw, roll of where you are looking.


---

### `client.camera_position()`
> Returns x, y, z world coordinates of the camera position.


---

### `client.timestamp()`
> Returns high precision timestamp in milliseconds.


---

### `client.eye_position()`
> Returns x, y, z world coordinates of the local player's eye position, or nil on failure.


---

### `client.set_clan_tag(...)`
> The clan tag is removed if no argument is passed or if it is an empty string. Additional arguments will be concatenated similar to client.log.

**Arguments:**
- `...`: The text that will be drawn

---

### `client.system_time()`
> Returns hour, minute, seconds, milliseconds.
local h, m, s, ms = client.system_time()


---

### `client.unix_time()`
> Returns hour, minute, seconds, milliseconds.
local time = client.unix_time()


---

### `client.reload_active_scripts()`
> Reloads all scripts the following frame.


---

### `client.create_interface(module_name, interface_name)`
> Returns a pointer to the interface, or nil on failure.

**Arguments:**
- `module_name`: Filename of the module that contains the interface
- `interface_name`: Name of the interface

---

### `client.find_signature(module_name, pattern)`
> Finds the specified pattern and returns its address, or nil if not found. CC is wildcard.

**Arguments:**
- `module_name`: Filename of the module that contains the interface
- `pattern`: String in the form of '\x01\x02\xCC\x03'

---

### `client.key_state(virtual_key)`
> Returns true if the key is pressed.

**Arguments:**
- `virtual_key`: Virtual key index

---

### `client.get_model_name(model_index)`
> Returns model name, or nil on failure.

**Arguments:**
- `model_index`: Model index

---

### `client.register_esp_flag(flag, r, g, b, callback)`
> Requires "Flags" is enabled in Player ESP

**Arguments:**
- `flag`: String of text that will be shown when callback returns true
- `r`: Red (1-255)
- `g`: Green (1-255)
- `b`: Blue (1-255)
- `callback`: Function that will be called for each entity while drawing the ESP

---

## config

### `config.load(name, tab_name, container_name)`
> To load the specified config: config.load('Config name here') To load a tab from the specified config: config.load('Config name here', 'Tab name here') To load a container from the specified config: config.load('Config name here', 'Tab name here', 'Container name here')

**Arguments:**
- `name`: Name of the config
- `tab_name`: Optional name of the tab
- `container_name`: Optional name of the container

---

### `config.export()`
> Returns the current config as a string


---

## cvar

### `cvar.set_string(value)`
**Arguments:**
- `value`: String value

---

### `cvar.get_string()`
> Returns nil on failure.


---

### `cvar.set_float(value)`
> cvar.cl_interp_ratio:set_float(1)

**Arguments:**
- `value`: Float value

---

### `cvar.set_raw_float(value)`
> This sets the float value without changing the integer and string values.

**Arguments:**
- `value`: Float value

---

### `cvar.get_float()`
> Returns nil if called on a ConCommand.


---

### `cvar.set_int(value)`
**Arguments:**
- `value`: Integer value

---

### `cvar.set_raw_int(value)`
> This sets the integer value without changing the float and string values.

**Arguments:**
- `value`: Integer value

---

### `cvar.get_int()`
> Returns nil if called on a ConCommand.


---

### `cvar.invoke_callback()`
> For ConCommands, optionally pass extra arguments and they will be forwarded to the callback. For ConVars, optionally pass an extra integer argument specifying the index of the change callback to invoke, otherwise all change callbacks will be invoked.
cvar.snd_setmixer:invoke_callback("Ambient", "vol", "0") -- equivalent to typing "snd_setmixer Ambient vol 0" in console


---

## database

### `database.write(key, value)`
> Saves a persistent table, possibly overwriting any existing data

**Arguments:**
- `key`: Name of the database, must be a string
- `value`: Value or table

---

### `database.read(key)`
> Returns a table

**Arguments:**
- `key`: Unique string identifier

---

## entity

### `entity.get_local_player()`
> Returns the entity index for the local player, or nil on failure.


---

### `entity.get_all(classname)`
> Returns an array of entity indices. Pass no arguments for all entities.

**Arguments:**
- `classname`: Optional string that specifies the class name of entities that will be added to the list, for example "CCSPlayer".

---

### `entity.get_players(enemies_only)`
> Returns an array of player entity indices. Dormant and dead players will not be added to the list.

**Arguments:**
- `enemies_only`: Optional. If true then you and the players on your team will not be added to the list.

---

### `entity.get_game_rules()`
> Returns entity index of CCSGameRulesProxy instance, or nil if none exists.


---

### `entity.get_player_resource()`
> Returns entity index of CCSPlayerResource instance, or nil if none exists.


---

### `entity.get_classname(ent)`
> Returns the name of the entity's class, or nil on failure.

**Arguments:**
- `ent`: Entity index.

---

### `entity.set_prop(ent, propname, value, array_index)`
**Arguments:**
- `ent`: Entity index.
- `propname`: Name of the networked property.
- `value`: The property will be set to this value. For vectors or angles, separate the components by commas.
- `array_index`: Optional. If propname is an array, the value at this array index will be set.

---

### `entity.get_prop(ent, propname, array_index)`
> Returns the value of the property, or nil on failure. For vectors or angles, this returns three values.

**Arguments:**
- `ent`: Entity index.
- `propname`: Name of the networked property.
- `array_index`: Optional. If propname is an array, the value at this array index will be returned.

---

### `entity.is_enemy(ent)`
> Returns true if the entity is on the other team.

**Arguments:**
- `ent`: Entity index.

---

### `entity.is_alive(ent)`
> Returns true if the player is not dead.

**Arguments:**
- `ent`: Entity index.

---

### `entity.is_dormant(ent)`
> Returns true if the player is not dormant.

**Arguments:**
- `ent`: Entity index.

---

### `entity.get_player_name(ent)`
> Returns the player's name, or the string "unknown" on failure.

**Arguments:**
- `ent`: Player entity index.

---

### `entity.get_player_weapon(ent)`
> Returns the entity index of the player's active weapon, or nil if the player is not alive, dormant, etc.

**Arguments:**
- `ent`: Player entity index.

---

### `entity.hitbox_position(player, hitbox)`
> Returns world coordinates x, y, z, or nil on failure.

**Arguments:**
- `player`: Entity index of the player.
- `hitbox`: Either a string of the hitbox name, or an integer index of the hitbox.

---

### `entity.get_steam64(player)`
> Returns steamID3, or nil on failure.

**Arguments:**
- `player`: Entity index of the player.

---

### `entity.get_bounding_box(player)`
> Returns x1, y1, x2, y2, alpha_multiplier. The contents of x1, y1, x2, y2 must be ignored when alpha_multiplier is zero, which indicates that the bounding box is invalid and should not be drawn.

**Arguments:**
- `player`: Entity index of the player.

---

### `entity.get_origin(player)`
> Returns x, y, z world coordinates of the entity's origin, or nil if the entity is dormant and dormant ESP information is not available.

**Arguments:**
- `player`: Entity index

---

### `entity.get_esp_data(player)`
> Returns a table containing alpha, health, and weapon_id, or nil on failure.

**Arguments:**
- `player`: Entity index

---

## globals

### `globals.realtime()`
> Returns the local time in seconds.


---

### `globals.curtime()`
> Returns the game time in seconds. This number is synchronized with the server.


---

### `globals.frametime()`
> Returns the number of seconds elapsed during the last game frame.


---

### `globals.absoluteframetime()`
> Returns the number of seconds elapsed during the last game frame.


---

### `globals.maxplayers()`
> Returns the maximum number of players in the server.


---

### `globals.tickcount()`
> Returns the number of ticks elapsed in the server.


---

### `globals.tickinterval()`
> Returns the time elapsed in one game tick in seconds.


---

### `globals.framecount()`
> Returns the number of frames since the game started


---

### `globals.mapname()`
> Returns the name of the loaded map, or nil if you are not in game.


---

### `globals.lastoutgoingcommand()`
> Returns the command number of the last outgoing command.


---

### `globals.oldcommandack()`
> Returns the command number of the previous server-acknowledged command.


---

### `globals.commandack()`
> Returns the command number of the most recent server-acknowledged command.


---

### `globals.chokedcommands()`
> Returns the number of choked commands, i.e. the number of commands that haven't yet been sent to the server.


---

## panorama

### `panorama.open(panel)`
**Arguments:**
- `panel`: Optional panel name

---

### `panorama.loadstring(js_code, panel)`
**Arguments:**
- `js_code`: String containing JavaScript code
- `panel`: Optional panel name

---

## materialsystem

### `materialsystem.get_name()`
> Returns name of the material


---

### `materialsystem.reload()`
> Resets the material


---

### `materialsystem.color_modulate(r, g, b)`
**Arguments:**
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)

---

### `materialsystem.alpha_modulate(alpha)`
**Arguments:**
- `alpha`: Opacity (0-255)

---

### `materialsystem.set_shader_param(param_name, value, force)`
**Arguments:**
- `param_name`: Name of the shader parameter
- `value`: New value
- `force`: Optional boolean. Add the var if it does not exist in the material

---

### `materialsystem.get_shader_param(param_name)`
**Arguments:**
- `param_name`: Name of the shader parameter

---

### `materialsystem.set_material_var_flag(index, enabled)`
**Arguments:**
- `index`: Index of MaterialVarFlags_t
- `enabled`: Boolean

---

### `materialsystem.get_material_var_flag(index)`
> Returns true if the specified flag is set

**Arguments:**
- `index`: Index of MaterialVarFlags_t

---

### `materialsystem.find_material(path, force_load)`
> Returns a reference to the material

**Arguments:**
- `path`: Path to material including filename
- `force_load`: Optional boolean. Load the material if it isn't loaded

---

### `materialsystem.find_materials(partial_path, force_load)`
> Returns a table of references to materials that have partial_path in their name

**Arguments:**
- `partial_path`: Partial path to material
- `force_load`: Optional boolean. Load each material if it isn't loaded

---

### `materialsystem.find_texture(path)`
> Returns a reference to the texture that can be used with set_shader_param

**Arguments:**
- `path`: Path to texture including filename

---

### `materialsystem.get_model_materials(entindex)`
> Returns a table of references to materials used by the entity

**Arguments:**
- `entindex`: Entity index

---

### `materialsystem.arms_material()`
> Returns a reference to the arms material when 'Viewmodel arms' is enabled


---

### `materialsystem.chams_material()`
> Returns a reference to the player chams material


---

## plist

### `plist.set(entindex, field, value)`
**Arguments:**
- `entindex`: Player index
- `field`: Name of the field
- `value`: Value of the field

---

### `plist.get(entindex, field)`
**Arguments:**
- `entindex`: Player index
- `field`: Name of the field

---

## renderer

### `renderer.text(x, y, r, g, b, a, flags, max_width, ...)`
> This can only be called from the paint callback.

**Arguments:**
- `x`: Screen coordinate
- `y`: Screen coordinate
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (0-255)
- `flags`: "+" for large text, "-" for small text, "c" for centered text, "r" for right-aligned text, "b" for bold text, "d" for high DPI support. "c" can be combined with other flags. nil can be specified for normal sized uncentered text.
- `max_width`: Text will be clipped if it exceeds this width in pixels. Use 0 for no limit.
- `...`: Text that will be drawn

---

### `renderer.measure_text(flags, ...)`
> Returns width, height. This can only be called from the paint callback.

**Arguments:**
- `flags`: "+" for large text, "-" for small text, or nil for normal sized text.
- `...`: Text that will be measured

---

### `renderer.rectangle(x, y, w, h, r, g, b, a)`
> This can only be called from the paint callback.

**Arguments:**
- `x`: Screen coordinate
- `y`: Screen coordinate
- `w`: Width in pixels
- `h`: Height in pixels
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (0-255)

---

### `renderer.line(xa, ya, xb, yb, r, g, b, a)`
> This can only be called from the paint callback.

**Arguments:**
- `xa`: Screen coordinate of point A
- `ya`: Screen coordinate of point A
- `xb`: Screen coordinate of point B
- `yb`: Screen coordinate of point B
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (0-255)

---

### `renderer.gradient(x, y, w, h, r1, g1, b1, a1, r2, g2, b2, a2, ltr)`
> This can only be called from the paint callback.

**Arguments:**
- `x`: Screen coordinate
- `y`: Screen coordinate
- `w`: Width in pixels
- `h`: Height in pixels
- `r1`: Red (0-255)
- `g1`: Green (0-255)
- `b1`: Blue (0-255)
- `a1`: Alpha (0-255)
- `r2`: Red (0-255)
- `g2`: Green (0-255)
- `b2`: Blue (0-255)
- `a2`: Alpha (0-255)
- `ltr`: Left to right. Pass true for horizontal gradient, or false for vertical.

---

### `renderer.circle(x, y, r, g, b, a, radius, start_degrees, percentage)`
> This can only be called from the paint callback.

**Arguments:**
- `x`: Screen coordinate
- `y`: Screen coordinate
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (0-255)
- `radius`: Radius of the circle in pixels.
- `start_degrees`: 0 is the right side, 90 is the bottom, 180 is the left, 270 is the top.
- `percentage`: Must be within [0.0-1.0]. 1.0 is a full circle, 0.5 is a half circle, etc.

---

### `renderer.circle_outline(x, y, r, g, b, a, radius, start_degrees, percentage, thickness)`
> This can only be called from the paint callback.

**Arguments:**
- `x`: Screen coordinate
- `y`: Screen coordinate
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (0-255)
- `radius`: Radius of the circle in pixels.
- `start_degrees`: 0 is the right side, 90 is the bottom, 180 is the left, 270 is the top.
- `percentage`: Must be within [0.0-1.0]. 1.0 is a full circle, 0.5 is a half circle, etc.
- `thickness`: Thickness of the outline in pixels.

---

### `renderer.triangle(x0, y0, x1, y1, x2, y2, r, g, b, a)`
> This can only be called from the paint callback.

**Arguments:**
- `x0`: Screen coordinate X for point A
- `y0`: Screen coordinate Y for point A
- `x1`: Screen coordinate X for point B
- `y1`: Screen coordinate Y for point B
- `x2`: Screen coordinate X for point C
- `y2`: Screen coordinate Y for point C
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (0-255)

---

### `renderer.world_to_screen(x, y, z)`
> Returns two screen coordinates (x, y), or nil if the world position is not visible on your screen. This can only be called from the paint callback.

**Arguments:**
- `x`: Position in world space
- `y`: Position in world space
- `z`: Position in world space

---

### `renderer.indicator(r, g, b, a, ...)`
> Returns the Y screen coordinate (vertical offset) of the drawn text, or nil on failure. This can only be called from the paint callback.

**Arguments:**
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (0-255)
- `...`: The text that will be drawn

---

### `renderer.texture(id, x, y, w, h, r, g, b, a, mode)`
> In fill mode, the texture will be stretched to the specified size. This may cause textures to appear blurry if the specified size is not the same as the texture's size. In repeat mode, the texture will be tiled.

**Arguments:**
- `id`: Texture ID
- `x`: X screen coordinate
- `y`: Y screen coordinate
- `w`: Width
- `h`: Height
- `r`: Red (0-255)
- `g`: Green (0-255)
- `b`: Blue (0-255)
- `a`: Alpha (1-255)
- `mode`: Optional string: "f" for fill, "r" for repeat, otherwise automatic

---

### `renderer.load_svg(contents, width, height)`
> Returns a texture ID that can be used with renderer.texture, or nil on failure

**Arguments:**
- `contents`: SVG file contents
- `width`: Width
- `height`: Height

---

### `renderer.load_png(contents, width, height)`
> Returns a texture ID that can be used with renderer.texture, or nil on failure

**Arguments:**
- `contents`: PNG file contents
- `width`: Width
- `height`: Height

---

### `renderer.load_jpg(contents, width, height)`
> Returns a texture ID that can be used with renderer.texture, or nil on failure

**Arguments:**
- `contents`: JPG file contents
- `width`: Width
- `height`: Height

---

### `renderer.load_rgba(contents, width, height)`
> Returns a texture ID that can be used with renderer.texture, or nil on failure

**Arguments:**
- `contents`: RGBA buffer
- `width`: Width
- `height`: Height

---

## ui

### `ui.new_checkbox(tab, container, name)`
> Returns a special value that can be passed to ui.get and ui.set, or throws an error on failure.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this control will be added.
- `name`: The name of the checkbox.

---

### `ui.new_slider(tab, container, name, min, max, init_value, show_tooltip, unit, scale, tooltips)`
> Returns a special value that can be passed to ui.get and ui.set, or throws an error on failure.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this control will be added.
- `name`: The name of the slider.
- `min`: The minimum value that can be set using the slider.
- `max`: The maximum value that can be set using the slider.
- `init_value`: Optional integer. The initial value. If not provided, the initial value will be min.
- `show_tooltip`: Optional boolean. true if the slider should display its current value.
- `unit`: Optional string that is two characters or less. This will be appended to the display value. For example, "px" for pixels or "%" for a percentage.
- `scale`: Optional The display value will be multiplied by this scale. For example, 0.1 will make a slider with the range [0-1800] show as 0.0-180.0 with one decimal place.
- `tooltips`: Optional table used to override the tooltip for the specified values. The key must be within min-max. The value is a string that will be shown instead of the numeric value whenever that value is selected.

---

### `ui.new_combobox(tab, container, name, ...)`
> Returns a special value that can be passed to ui.get and ui.set, or throws an error on failure.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this control will be added.
- `name`: The name of the combobox.
- `...`: One or more comma separated string values that will be added to the combobox. Alternatively, a table of strings that will be added.

---

### `ui.new_multiselect(tab, container, name, ...)`
> Returns a special value that can be passed to ui.get and ui.set, or throws an error on failure.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this control will be added.
- `name`: The name of the multiselect.
- `...`: One or more comma separated string values that will be added to the combobox. Alternatively, a table of strings that will be added.

---

### `ui.new_hotkey(tab, container, name, inline, default_hotkey)`
> Returns a special value that can be passed to ui.get to see if the hotkey is pressed, or throws an error on failure.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this control will be added.
- `name`: The name of the hotkey.
- `inline`: Optional boolean. If set to true, the hotkey will be placed to the right of the preceding menu item.
- `default_hotkey`: Optional virtual key

---

### `ui.new_button(tab, container, name, callback)`
> Throws an error on failure. The return value should not be used with ui.set or ui.get.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this checkbox will be added.
- `name`: The name of the button.
- `callback`: The lua function that will be called when the button is pressed.

---

### `ui.new_color_picker(tab, container, name, r, g, b, a)`
> Throws an error on failure. The color picker is placed to the right of the previous menu item.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this checkbox will be added.
- `name`: The name of the color picker. This will not be shown, it is only used to identify this item in saved configs.
- `r`: Optional initial red value (0-255)
- `g`: Optional initial green value (0-255)
- `b`: Optional initial blue value (0-255)
- `a`: Optional initial alpha value (0-255)

---

### `ui.new_textbox(tab, container, name)`
> Throws an error on failure. Returns a special value that can be used with ui.get

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this textbox will be added.
- `name`: The name of the textbox

---

### `ui.new_listbox(tab, container, name, items)`
> Throws an error on failure. Returns a special value that can be used with ui.get. Calling ui.get on a listbox will return the zero-based index of the currently selected string.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA
- `container`: The name of the existing container to which this listbox will be added
- `name`: Name
- `items`: Optional table of items (strings)

---

### `ui.new_string(name, value)`
> Returns a special value that can be used with ui.get and ui.set. This function does not create any menu items. The value will be stored in configs just like other menu items.

**Arguments:**
- `name`: Name
- `value`: Optional string that specifies the default value.

---

### `ui.new_label(tab, container, name)`
> Returns a special value that can be used with ui.set

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA
- `container`: The name of the existing container to which this listbox will be added
- `name`: Name

---

### `ui.reference(tab, container, name)`
> Avoid calling this from inside a function. Returns a reference that can be passed to ui.get and ui.set, or throws an error on failure. This allows you to access a built-in pre-existing menu items. This function returns multiple values when the specified menu item is followed by unnamed menu items, for example a color picker or a hotkey.

**Arguments:**
- `tab`: The name of the tab: RAGE, AA, LEGIT, VISUALS, MISC, SKINS, PLAYERS, LUA.
- `container`: The name of the existing container to which this checkbox will be added.
- `name`: The name of the menu item.

---

### `ui.set(item, value, ...)`
> For checkboxes, pass true or false. For a slider, pass a number that is within the slider's minimum/maximum values. For a combobox, pass a string value. For a multiselect combobox, pass zero or more strings. For referenced buttons, value is ignored and the button's callback is invoked. For color pickers, pass the arguments r, g, b, a.

**Arguments:**
- `item`: The result of either ui.new_* or ui.reference
- `value`: The value to which the menu item will be set
- `...`: Optional. For multiselect comboboxes, you may want to set more than one option.

---

### `ui.get(item)`
> For a checkbox, returns true or false. For a slider, returns an integer. For a combobox, returns a string. For a multiselect combobox, returns an array of strings. For a hotkey, returns true if the hotkey is active. For a color picker, returns r, g, b, a. Throws an error on failure.

**Arguments:**
- `item`: The special value returned by ui.new_checkbox, ui.new_slider, ui.new_combobox, ui.new_hotkey, or ui.reference.

---

### `ui.set_callback(item, callback)`
> item is passed as an argument to the callback function.

**Arguments:**
- `item`: The special value returned by ui.new_*. Do not try passing a reference to an existing menu item.
- `callback`: Lua function that will be called when the menu item changes values. For example, this will be called when the user checks or unchecks a checkbox.

---

### `ui.set_visible(item, visible)`
**Arguments:**
- `item`: A menu item reference.
- `visible`: Boolean. Pass false to hide the control from the menu.

---

### `ui.is_menu_open()`
> Returns true if the menu is currently open.


---

### `ui.mouse_position()`
> Returns current mouse coordinates x, y


---

### `ui.menu_position()`
> Returns current window coordinates x, y


---

### `ui.menu_size()`
> Returns current menu size width, height


---

### `ui.name(item)`
> Returns the display name

**Arguments:**
- `item`: Reference to menu item

---
