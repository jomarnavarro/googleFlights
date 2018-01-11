Then(/^User will be on In all Media page with "([^"]*)"$/) do |title|
  ensure_page(InAllMediaPage)
  @page.validate(title)
end

Then(/^The In All Media Logo will be displayed$/) do
  ensure_page(InAllMediaPage)
  @page.validate_logo
end