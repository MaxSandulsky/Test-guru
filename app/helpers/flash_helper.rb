module FlashHelper
  def flash_contents
    tags = html_escape('')
    flash.each { |key, message| tags << (content_tag :p, message, class: "flash #{key}") }
    tags
  end
end
