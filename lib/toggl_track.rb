require_relative 'toggl_track/version'

require_relative 'toggl_track/connection'

require_relative 'toggl_track/api'
require_relative 'reportsv2'

# :mode => :compat will convert symbols to strings
Oj.default_options = { mode: :compat }

module TogglTrack
  NAME = "TogglTrack v#{TogglTrack::VERSION}".freeze
end
