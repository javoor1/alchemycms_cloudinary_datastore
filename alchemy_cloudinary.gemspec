# -*- encoding: utf-8 -*-
# stub: alchemy_cloudinary 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "alchemy_cloudinary".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas von Deyen".freeze]
  s.date = "2022-06-10"
  s.description = "AlchemyCMS Cloudinary Integration.".freeze
  s.email = ["thomas@vondeyen.com".freeze]
  s.files = ["MIT-LICENSE".freeze, "README.md".freeze, "lib/alchemy".freeze, "lib/alchemy/picture".freeze, "lib/alchemy/picture/cloudinary_url.rb".freeze, "lib/alchemy_cloudinary".freeze, "lib/alchemy_cloudinary.rb".freeze, "lib/alchemy_cloudinary/dragonfly_data_store.rb".freeze, "lib/alchemy_cloudinary/engine.rb".freeze, "lib/alchemy_cloudinary/version.rb".freeze]
  s.homepage = "https://alchemy-cms.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "AlchemyCMS Cloudinary Integration.".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<alchemy_cms>.freeze, [">= 4.1.0.beta", "< 7"])
    s.add_runtime_dependency(%q<cloudinary>.freeze, ["~> 1.9"])
  else
    s.add_dependency(%q<alchemy_cms>.freeze, [">= 4.1.0.beta", "< 7"])
    s.add_dependency(%q<cloudinary>.freeze, ["~> 1.9"])
  end
end
