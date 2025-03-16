module ApplicationHelper
  def avatar_tag(avatar)
    return if avatar.blank?

    picture_tag(
      url_for(avatar),
      image: {
        class: "rounded-full mx-auto object-cover h-[120px] w-[120px]"
      }
    )
  end
end
