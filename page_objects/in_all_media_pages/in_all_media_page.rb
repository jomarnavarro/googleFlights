require_relative '../page_object'
# takes care of 'all in media' steps and validations
class InAllMediaPage < PageObject
  # object repository section
  define :title_elem, xpath: '//title'
  define :logo_img, xpath: '//img[contains(@src, "IAM-LOGO")]'

  def validate_logo
    fail(FieldPresenceError.new('Logo not present')) unless \
      present?(:logo_img)
  end

  def validate(title)
    fail(TextContentError.new('Title is not correct', title: @driver.title)) unless \
      @driver.title == title
  end
end
