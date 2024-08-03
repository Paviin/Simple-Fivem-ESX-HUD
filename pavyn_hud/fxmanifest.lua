fx_version 'cerulean'

game 'gta5'

author 'pavyn'

version '1.0'

shared_scripts {
    '@es_extended/imports.lua',
	'Config.lua'
}

client_scripts {
    'lua/cl_main.lua'
}

server_scripts {
    'lua/sv_main.lua'
}

ui_page 'ui/index.html'

files {
    'ui/**/*'
}

dependencies {
    'es_extended'
}