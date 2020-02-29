source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.2"

# Use Puma as the app server
gem "puma", "~> 3.12"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use sqlite3 as the database for Active Record
gem 'sqlite3', :group => :development 
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"
gem "actionview", ">= 5.1.6.2"
gem "nokogiri", ">= 1.8.5"
gem "rack", ">= 2.0.6"
gem "loofah", ">= 2.2.3"
gem "ffi", ">= 1.9.24"
gem "sprockets", ">= 3.7.2"
# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "dotenv-rails"
  gem "pry-rails"
  gem "grade_runner", github: "firstdraft/grade_runner"
  gem "web_git", github: "firstdraft/web_git"
  gem "awesome_print"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "draft_log", github: "firstdraft/draft_log"
  gem "dev_toolbar", github: "firstdraft/dev_toolbar"
  gem "binding_of_caller"
  gem "draft_generators", github: "firstdraft/draft_generators"
  gem "letter_opener"
  gem "meta_request"
  gem "wdm", platforms: [:mingw, :mswin, :x64_mingw]
  gem "console_ip_whitelist", github: "firstdraft/console_ip_whitelist"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "webmock"
end

gem "activeadmin", github: "activeadmin/activeadmin"
gem "devise", github: "plataformatec/devise"
gem "faker", github: "stympy/faker"

group :production do
  gem 'pg'
end