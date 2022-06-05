local awful = require'awful'
local VolumeManager = {volume = 100, default = 5}
function VolumeManager:update()
	awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ "..self.volume.."%")
end
function VolumeManager:increment(value)
	value = value or self.default
	value = math.abs(value)
	self.volume = math.min(self.volume + value)
	self:update()
end

function VolumeManager:decrement(value)
	value = value or self.default
	value = math.abs(value)
	self.volume = math.max(self.volume - value, 0)
	self:update()
end
return VolumeManager