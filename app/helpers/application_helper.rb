module ApplicationHelper
  ActionView::Base.default_form_builder = TailwindFormBuilder
  
  def home_link
    link_to "Home", root_path
  end
end
