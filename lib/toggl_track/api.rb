require_relative 'clients'
require_relative 'dashboard'
require_relative 'project_users'
require_relative 'projects'
require_relative 'tags'
require_relative 'tasks'
require_relative 'time_entries'
require_relative 'users'
require_relative 'version'
require_relative 'workspaces'

module TogglTrack
  TOGGL_API_URL = 'https://api.track.toggl.com/api'.freeze

  class API
    include TogglTrack::Connection

    TOGGL_API_V8_URL = "#{TOGGL_API_URL}/v8/".freeze

    attr_reader :conn, :toggl_api_file

    def initialize(username = nil, password = API_TOKEN, **opts)
      if username.nil? && password == API_TOKEN
        @toggl_api_file = File.join(Dir.home, TOGGL_FILE)

        raise auth_instructions unless File.exist?(@toggl_api_file)

        username = IO.read(@toggl_api_file).strip
      end

      @conn = TogglTrack::Connection.open(username, password, TOGGL_API_V8_URL, **opts)
    end

    private

    def auth_instructions
      <<~EOMSG
        Expecting one of:
          1) api_token in file #{@toggl_api_file}, or
          2) parameter: (api_token), or
          3) parameters: (username, password).
              See https://github.com/gee-forr/toggl-track#togglv8api
              and https://github.com/toggl/toggl_api_docs/blob/master/chapters/authentication.md
      EOMSG
    end
  end
end
