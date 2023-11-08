# Simple Mining Job For QB-CORE 
Used for ox_inventory

### What do I need?
There are 3 dependencies needed to make sure the script runs smoothly:

- [ox-lib](https://github.com/overextended/ox_lib/releases/)
- [ox-inventory](https://github.com/overextended/ox_inventory/)
- [ox-target](https://github.com/overextended/ox_target)

### optional :
- [qb-lock](https://github.com/Nathan-FiveM/qb-lock)
- [k5_notify](https://github.com/kac5a/k5_notify)

### Resmon
Start up: ~0.1/ms

In use: ~0.01/ms

Idle: 0.00/ms

### Installation
- Drag and drop the images into ox_inventory: [ox_inventory\web\images]
- Copy and paste the items into ox_inventory: [ox_inventory\data\items.lua]

### Item
register items in ox_inventory/data/item
```lua
['batu'] = {
	label = 'Stone',
	weight = 750,
	stack = true,
	close = false,
},

['batucuci'] = {
	label = 'Washed Stone',
	weight = 750,
	stack = true,
	close = false,
},

['tembaga'] = {
	label = 'Copper',
	weight = 750,
	stack = true,
	close = false,
},

['permata'] = {
	label = 'Diamond',
	weight = 105,
	stack = true,
	close = false,
},

['emas'] = {
	label = 'Gold',
	weight = 950,
	stack = false,
	close = false,
},

['baja'] = {
	label = 'Iron',
	weight = 750,
	stack = true,
	close = false,
},

['beliung'] = {
	label = 'Pickaxe',
	weight = 450,
	stack = false,
	close = false,
},
```


