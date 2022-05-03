-- from incredible-gmod.ru with <3

local classes = discordia.class.classes
local Message = classes.Message
local TextChannel = classes.TextChannel
local GuildTextChannel = classes.GuildTextChannel

local endpoints = {
	start_from_message = "/channels/%s/messages/%s/threads",
	start_without_message = "/channels/%s/threads",
	join = "/channels/%s/thread-members/@me",
	leave = "/channels/%s/thread-members/@me",
	add_member = "/channels/%s/thread-members/%s",
	remove_member = "/channels/%s/thread-members/%s",
	get_member = "/channels/%s/thread-members/%s",
	list_members = "/channels/%s/thread-members",
	list_active = "/channels/%s/threads/active",
	list_public_archived = "/channels/%s/threads/archived/public",
	list_private_archived = "/channels/%s/threads/archived/private",
	list_joined_private_archived = "/channels/%s/users/@me/threads/archived/private",
}

function Message:CreateThread(payload)
	return self._parent:CreateThread(payload, self)
end

function TextChannel:CreateThread(payload, message_from)
	if message_from then
		return self.client._api:request("POST", endpoints.start_from_message:format(self.id, message_from.id), payload)
	else
		return self.client._api:request("POST", endpoints.start_without_message:format(self.id), payload)
	end
end

GuildTextChannel.CreateThread = TextChannel.CreateThread -- discordia class lib is a bit stupid, for some reason inheritance works stupidly

function TextChannel:JoinThread()
	return self.client._api:request("PUT", endpoints.join:format(self.id))
end

GuildTextChannel.JoinThread = TextChannel.JoinThread

function TextChannel:LeaveThread()
	return self.client._api:request("DELETE", endpoints.leave:format(self.id))
end

GuildTextChannel.LeaveThread = TextChannel.LeaveThread

function TextChannel:AddThreadMember(user)
	return self.client._api:request("PUT", endpoints.add_member:format(self.id, user.user and user.user.id or user.id))
end

GuildTextChannel.AddThreadMember = TextChannel.AddThreadMember

function TextChannel:RemoveThreadMember(user)
	return self.client._api:request("DELETE", endpoints.remove_member:format(self.id, user.user and user.user.id or user.id))
end

GuildTextChannel.RemoveThreadMember = TextChannel.RemoveThreadMember

function TextChannel:GetThreadMember(user)
	return self.client._api:request("GET", endpoints.get_member:format(self.id, user.user and user.user.id or user.id))
end

GuildTextChannel.GetThreadMember = TextChannel.GetThreadMember

function TextChannel:ListThreadMembers()
	return self.client._api:request("GET", endpoints.list_members:format(self.id))
end

GuildTextChannel.ListThreadMembers = TextChannel.ListThreadMembers

function TextChannel:ListActiveThreads()
	return self.client._api:request("GET", endpoints.list_active:format(self.id))
end

GuildTextChannel.ListActiveThreads = TextChannel.ListActiveThreads

function TextChannel:ListArchived(private, private_joined)
	return self.client._api:request("GET", (private and (private_joined and list_joined_private_archived or list_private_archived) or list_public_archived).list_active:format(self.id))
end

GuildTextChannel.ListArchived = TextChannel.ListArchived