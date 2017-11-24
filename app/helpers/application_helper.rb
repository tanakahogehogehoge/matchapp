module ApplicationHelper
  def profile_img(owner)
    return image_tag(owner.avatar, alt: owner.name) if owner.avatar?

    unless owner.provider.blank?
      img_url = owner.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: owner.name)
  end
end
