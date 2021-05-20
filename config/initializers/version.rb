Rails.application.class_eval do
  VERSION = '1.0.1'.freeze
  
  def version
    VERSION
  end
end
