# encoding: utf-8
#!/usr/bin/env ruby

class MainPage <SitePrism::Page
  element :search_input, '#twotabsearchtextbox'
  element :product_found, '.s-image'
end

class ProductPage <SitePrism::Page
  element :product_title, '#productTitle'
  element :cart_button, '#add-to-cart-button'
  element :go_to_basket, '#hlb-view-cart-announce'
  element :size_256gb, '#size_name_2'
  element :black_color, "#color_name_0"
  element :added_to_cart_message, '#huc-v2-order-row-messages'
end
