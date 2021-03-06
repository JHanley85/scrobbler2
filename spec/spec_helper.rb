# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper.rb"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'rubygems'
require 'bundler/setup'
require 'httparty'
require 'fakeweb'
require_relative '../lib/scrobbler2.rb'
$: << File.dirname(__FILE__) + "/../lib/"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

# These are real, so that the tests will pass.
# The session-key allows authenticated access as the last.fm user 'scrobbler2'
# Please do not use them in your own apps.
Scrobbler2::Base.api_key = "c62652cbaabd91e0553c7b415c5a3dbc"
Scrobbler2::Base.api_secret = "03c60c8b07bab6f8e91675d8e16fcd0c"
Scrobbler2::Base.session_key = "91518cf316876a405f3f8194724a3c6e"

def wait(time, increment = 5, elapsed_time = 0, &block)
	begin
		yield
	rescue Exception => e
		if elapsed_time >= time
			raise e
		else
			sleep increment
			wait(time, increment, elapsed_time + increment, &block)
		end
	end
end

