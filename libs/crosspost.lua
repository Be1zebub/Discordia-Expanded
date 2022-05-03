local Message = discordia.class.classes.Message
local endpoint = "/channels/%s/messages/%s/crosspost"
local is_crosspost_enum = discordia.enums.messageFlag.isCrosspost

function Message:Crosspost()
	return client._api:request("POST", endpoint:format(self.channel.id, self.id))
end

function Message:isCrosspost()
	return self:hasFlag(is_crosspost_enum)
end