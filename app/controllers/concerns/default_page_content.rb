module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Rails Portfolio | Learning'
    @seo_keywords = 'rails, ruby, portfolio, blog'
  end
end
