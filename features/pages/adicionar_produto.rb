# frozen_string_literal: true

class AdcProduct < SitePrism::Page # :nodoc:
  set_url :'http://automationpractice.com/index.php'

  element :inpt_search_top, '#search_query_top'
  element :btn_search_top, '#searchbox > button'
  element :slct_product, '#center_column > ul > li > div > div.left-block > div > a.product_img_link > img'
  element :btn_add_cart, '.button.ajax_add_to_cart_button.btn.btn-default'
  element :icon_ok, 'i.icon-ok'
  element :btn_proceed_checkout, 'a.btn.btn-default.button.button-medium'
  element :cart_title, '#cart_title'
  element :summary, '.step_current'
  element :sign_in, '.step_todo.second'
  element :adress, '.step_todo.third'
  element :shipping, '.step_todo.four'
  element :payment, '.step_todo.last'
  element :btn_cart_proceed_checkout, '.button.btn.btn-default.standard-checkout.button-medium'
  element :your_cart, '.navigation_page'
  element :product_name_store, '#layer_cart_product_title'
  element :product_name_cart, '.product-name'

  def pesquisa
    page.windows[0].maximize
    inpt_search_top.click
    inpt_search_top.set('shirt')
    btn_search_top.click
  end

  def produto
    slct_product.hover
    sleep(5) #Aguardando carregamento do modal
    btn_add_cart.click
  end
end
