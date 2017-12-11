#encoding: utf-8

# Load the Rails application.
require_relative 'application'


# Initialize the Rails application.
Rails.application.initialize!
require 'fine_worker' # подключаем файл

Time::DATE_FORMATS[:ru_datetime] = "%Y.%m.%d в %k:%M:%S"
Time::DATE_FORMATS[:krat_datetime] = "%Y.%m.%d"