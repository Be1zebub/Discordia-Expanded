# Discordia-Expanded

A library that expands the [Discordia](https://github.com/SinisterRectus/Discordia) features

## Documentation

There is no documentation at this moment, read the library code to learn more

## Installation

1. Open your project `deps` folder
2. Run `git clone git@github.com:Be1zebub/Discordia-Expanded.git`.

## Examples

auto crossposting
```lua
client:on("messageCreate", function(msg)
	if msg.channel.type == 5 then -- is news channel
		msg:Crosspost()
	end
end)
```

auto threads
```lua
client:on("messageCreate", function(msg)
	if msg.channel.type == 5 then -- is news channel
		msg:CreateThread({name = msg.id})
	end
end)
```

## PS

The library is being developed as new things are needed in my projects, so there are many things that have recently been added to the api discord - but ive still doesnt added it into this lib.  
Here are some other libraries that expand the Discordia features, you can use them together with Discordia Expanded to make your bots better.  
https://github.com/GitSparTV/discordia-slash  
https://github.com/Bilal2453/discordia-interactions  
https://github.com/Bilal2453/discordia-components
