Given(/^User google searches "([^"]*)"$/) do |keyword|
  ensure_page(GoogleSearchPage)
  @page.search(keyword)
end

When(/^User clicks on link leading to in all media url$/) do
  ensure_page(GoogleSearchPage)
  @page.click_in_all_media_url
end
