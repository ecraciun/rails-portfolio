class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = MiliCopyViewTool::Renderer.copyright 'Emil C', 'All rights reserved'
  end
end

# Yeah this was supposed to be in a custom built gem, but I'm not going to do that. Got how it works
module MiliCopyViewTool
  class Renderer
    def self.copyright(name, message)
      "&copy #{Time.now.year} | <b>#{name}</b> #{message}".html_safe
    end
  end
end
