require_relative '../page_object'
# Takes care of google search steps and validations
class GoogleSearchPage < PageObject
  # object repository section
  define :search_txt, name: 'q'
  define :search_btn, name: 'btnK'
  define :search_results_div, id: 'search'
  define :in_all_media_lnk, css: 'a[href*="inallmedia.com"]'

  def at?
    present?(:search_txt)
  end

  def search(keyword)
    input(:search_txt, keyword)
    click(:search_btn)
    fail(FieldPresenceError.new('Search results not displayed', keyword: keyword)) \
      unless present?(:search_results_div)
  end

  def click_in_all_media_url
    click(:in_all_media_lnk)
  end
end