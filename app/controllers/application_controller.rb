class ApplicationController < ActionController::Base
  include Authentication, CurrentTimezone, McpIdentification

  stale_when_importmap_changes
  allow_browser versions: :modern
end
