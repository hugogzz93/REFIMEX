# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( frontpage.css )
Rails.application.config.assets.precompile += %w( frontpage.coffee )

Rails.application.config.assets.precompile += %w( img/thumb/fuel_station )
Rails.application.config.assets.precompile += %w( img/thumb/refmex_logo )
Rails.application.config.assets.precompile += %w( img/thumb/tubes )
Rails.application.config.assets.precompile += %w( img/thumb/fuel_truck )
Rails.application.config.assets.precompile += %w( img/thumb/grass )
Rails.application.config.assets.precompile += %w( img/thumb/refinery )
Rails.application.config.assets.precompile += %w( img/thumb/fuel )
Rails.application.config.assets.precompile += %w( img/thumb/trucks )
Rails.application.config.assets.precompile += %w( img/thumb/general )
Rails.application.config.assets.precompile += %w( img/thumb/blue_truck )
Rails.application.config.assets.precompile += %w( img/thumb/fueling )


