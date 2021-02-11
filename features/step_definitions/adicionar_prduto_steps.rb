# frozen_string_literal: true

Dado('que eu esteja na página home') do
  @adc_product = AdcProduct.new
  @adc_product.load
  page.save_screenshot('log/01_access.png')
end

Quando('busco por um produto') do
  @adc_product.pesquisa
  page.save_screenshot('log/02_search_product.png')
end

E('adiciono um produto ao carrinho') do
  @adc_product.produto
  @store_product_name = @adc_product.product_name_store.text
  page.save_screenshot('log/03_selected_product.png')
end

Entao('verifico que o produto foi adicionado ao carrinho') do
  expect(@adc_product.icon_ok).to be_visible
  expect(page).to have_text MASSA['cart']['product_added']
  @adc_product.btn_proceed_checkout.click
  expect(@adc_product.cart_title.text.split("\n").first).to eql(MASSA['cart']['cart_summary'])
  expect(@adc_product.cart_title.text.split("\n").last).to eql(MASSA['cart']['shopping_cart'])
  expect(@adc_product.summary.text).to eql(MASSA['cart']['summary'])
  expect(@adc_product.sign_in.text).to eql(MASSA['cart']['sign_in'])
  expect(@adc_product.adress.text).to eql(MASSA['cart']['adress'])
  expect(@adc_product.shipping.text).to eql(MASSA['cart']['shipping'])
  expect(@adc_product.payment.text).to eql(MASSA['cart']['payment'])
  expect(@adc_product.your_cart.text).to eql(MASSA['cart']['cart_text'])
  expect(@adc_product.btn_cart_proceed_checkout).to be_visible
  expect(@adc_product.your_cart).to be_visible
  expect(@adc_product.summary).to be_visible
  expect(@adc_product.sign_in).to be_visible
  expect(@adc_product.adress).to be_visible
  expect(@adc_product.shipping).to be_visible
  expect(@adc_product.payment).to be_visible
  expect(@adc_product.product_name_cart.text).to eql(@store_product_name)
  page.save_screenshot('log/04_adc_product.png')
end
