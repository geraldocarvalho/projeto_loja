# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require 'capybara'
require 'pry'
require 'capybara/cucumber'
require 'site_prism'
require 'yaml'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://automationpractice.com/index.php'
end

ParameterType(
  name: 'tipo',
  regexp: /positivo|negativo|validacao/,
  transformer: ->(type) { type }
)

MASSA = YAML.load_file("#{File.dirname(__FILE__)}/config/default_data.yaml")
