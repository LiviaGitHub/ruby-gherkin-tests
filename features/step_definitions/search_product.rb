# encoding: utf-8
# !/usr/bin/env ruby

# test case 1
Given(/^Amazon.de is opened$/) do
  visit 'https://www.amazon.de/'
  have_content('Hallo! Anmelden')
end

When(/^I search for iPhone XS 128gb$/) do
  @main_page.search_input.set('iPhone XR 128GB White')
  @main_page.search_input.native.send_keys(:enter)
end

And(/^I click on it to open its page$/) do
  find('.s-image', match: :first).click
end

Then(/^I should see all information about my product$/) do
  @product_page.product_title.visible?
end

# test case 2
And(/^I add it to the shopping cart$/) do
  @product_page.cart_button.click
end

Then(/^I should see the product in the cart$/) do
  @product_page.added_to_cart_message.visible?
  have_content('Zum Einkaufswagen hinzugefügt')
end

# test case 3
And(/^I remove our product from the cart$/) do
  @product_page.go_to_basket.click
  click_button 'Löschen'
end

Then(/^I should see the cart empty$/) do
  have_content('Ihr Einkaufswagen ist leer.')
end

# test case 4
And(/^I change the memory option to 256gb$/) do
  have_content('Größe: 128 GB')
  @product_page.size_256gb.click
end

And(/^I change the color to black$/) do
  have_content('Farbe: Weiß')
  @product_page.black_color.click
end

Then(/^I should see both options selected$/) do
  have_content('Größe: 256 GB')
  have_content('Farbe: Schwarz')
end
