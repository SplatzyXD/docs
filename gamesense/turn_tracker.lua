-- Turn Tracker for Gamesense
-- Tracks how many times a player turns a corner (yaw angle change ~90 degrees)

local turn_count = 0
local previous_yaw = nil
local cumulative_yaw_change = 0
local YAW_THRESHOLD = 75 -- Degrees to be considered a turn
local TIME_WINDOW = 0.5 -- Seconds to complete the turn
local last_turn_time = 0

-- Function to normalize angle differences to [-180, 180]
local function normalize_angle(angle)
    while angle > 180 do angle = angle - 360 end
    while angle < -180 do angle = angle + 360 end
    return angle
end

client.set_event_callback("setup_command", function(e)
    local current_yaw = e.yaw
    if current_yaw == nil then return end

    if previous_yaw ~= nil then
        -- Calculate the difference between current and previous yaw
        local delta_yaw = normalize_angle(current_yaw - previous_yaw)

        -- Add to cumulative change
        -- We only care about the magnitude of change in the same direction
        -- but for simplicity we track the absolute cumulative change over a short period.
        -- However, a better approach for corners is tracking continuous rotation.

        -- Let's track continuous rotation. If the player reverses direction, reset.
        if (delta_yaw > 0 and cumulative_yaw_change < 0) or (delta_yaw < 0 and cumulative_yaw_change > 0) then
            cumulative_yaw_change = delta_yaw
        else
            cumulative_yaw_change = cumulative_yaw_change + delta_yaw
        end

        -- Check if cumulative change exceeds threshold
        if math.abs(cumulative_yaw_change) >= YAW_THRESHOLD then
            local current_time = globals.realtime()
            -- Ensure we don't count the same turn multiple times in a short window
            if current_time - last_turn_time > TIME_WINDOW then
                turn_count = turn_count + 1
                last_turn_time = current_time
                -- Reset cumulative to avoid double counting
                cumulative_yaw_change = 0
            end
        end
    end

    previous_yaw = current_yaw
end)

client.set_event_callback("paint", function()
    -- Draw the turn count on the screen
    -- x, y, r, g, b, a, flags, max_width, text
    local screen_width, screen_height = client.screen_size()

    local x = 10
    local y = screen_height / 2

    renderer.text(x, y, 255, 255, 255, 255, "d", 0, "Turns: " .. tostring(turn_count))
end)

-- Reset count on round start or death if desired (optional)
client.set_event_callback("round_start", function()
    turn_count = 0
    cumulative_yaw_change = 0
    previous_yaw = nil
end)
