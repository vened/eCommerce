Rails.application.config.assets.version = '1.0'


Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "fonts")

Rails.application.config.assets.paths << Rails.root.join("app", "assets_staff", "css")
Rails.application.config.assets.paths << Rails.root.join("app", "assets_staff", "js")
Rails.application.config.assets.paths << Rails.root.join("app", "assets_staff", "img")

Rails.application.config.assets.precompile += %w( ckeditor/* )

Rails.application.config.assets.precompile += %w( staff.js )
Rails.application.config.assets.precompile += %w( staff.css )
Rails.application.config.assets.precompile += %w( login.css )
