module FlashHelper
  def flash_contents(key, message)
    content_tag :p, message, class: "flash #{key}"
  end
end
