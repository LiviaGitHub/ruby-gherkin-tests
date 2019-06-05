
Before ('@general') do
  page.driver.browser.manage.window.maximize
  visit 'https://www.amazon.de/'
  @main_page = MainPage.new
  @product_page = ProductPage.new
end

After do
	Capybara.reset_sessions!
end
