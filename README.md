# Discordia-Expanded

A library that expands the [Discordia](https://github.com/SinisterRectus/Discordia) features

## Documentation

There is no documentation at this moment, read the library code to learn more

## Installation

1. Open your project folder
2. Run `git clone git@github.com:Be1zebub/Discordia-Expanded.git deps/discordia-expanded`

## Examples

auto crossposting
```lua
require("discordia-expanded")

client:on("messageCreate", function(msg)
	if msg.channel.type == 5 then -- is news channel
		msg:Crosspost()
	end
end)
```

auto threads
```lua
require("discordia-expanded")

local forumChannels = {
	["676069143463723018"] = true,
	["773170907879178241"] = true
}

client:on("messageCreate", function(msg)
	if forumChannels[msg.channel.id] then
		msg:CreateThread({name = msg.id})
	end
end)
```

![Threads](https://github.com/Be1zebub/Discordia-Expanded/blob/main/demo/create_thread.jpg?raw=true)
![True reply](https://github.com/Be1zebub/Discordia-Expanded/blob/main/demo/true_reply.jpg?raw=true)

## PS

The library is being developed as new things are needed in my projects, so there are many things that have recently been added to the api discord - but ive still doesnt added it into this lib.  
Here are some other libraries that expand the Discordia features, you can use them together with Discordia Expanded to make your bots better.  
https://github.com/GitSparTV/discordia-slash  
https://github.com/Bilal2453/discordia-interactions  
https://github.com/Bilal2453/discordia-components
