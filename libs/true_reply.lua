-- from incredible-gmod.ru with <3

local classes = discordia.class.classes
local Message = classes.Message

Message._OldReply = Message.__OldReply or Message.reply

function Message:reply(content, noreply)
	if noreply ~= true then
		content = type(content) == "table" and content or {content = content}
		content.reference = {
			message = self,
			mention = true
		}
	end

	return self._parent:send(content)
end