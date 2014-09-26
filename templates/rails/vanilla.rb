inject_into_file 'test/test_helper.rb', after: "require 'rails/test_help'" do
  "\nrequire 'minitest/pride'"
end

gem_group :development do
  gem 'guard-minitest'
  gem 'pry-rails'
  gem 'pry-doc'
end

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end

