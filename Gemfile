# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'rspec', group: :test
gem 'capybara', group: :test
gem 'simplecov', require: false, group: :test
gem 'pg'

group :development, :test do
  gem "rubocop", "0.79.0"
end
