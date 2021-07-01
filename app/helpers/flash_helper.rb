module FlashHelper
  def flash_contents(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
