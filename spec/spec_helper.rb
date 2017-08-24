# frozen_string_literal: true

require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift(File.join(__dir__, '..', 'lib'))
$LOAD_PATH.unshift(__dir__)
require 'karousel'
require 'support/client_job_dummy'
require 'support/dummy_server'
