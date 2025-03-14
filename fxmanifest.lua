fx_version 'cerulean'

game 'gta5'

author 'Sync Scripts (sync_001)'

description 'Sync-Pizzeria'

version '1.0'

client_scripts{
    'client.lua',
    'targets.lua',
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua'
}

shared_scripts{
    'config.lua'
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}