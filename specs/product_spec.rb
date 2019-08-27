require('minitest')
require('minitest/autorun')
require('minitest/rg')
require_relative('../models/product')
require('pry')


class ProductTest < MiniTest::Test

  def setup
    @product1 = Product.new({ 'name' => 'mk25', 'description' => 'regulator', 'quantity' => 5, 'buy_cost' => 580.00, 'sell_price' => 675.00})
    @product2 = Product.new({ 'name' => 'xforce', 'description' => 'bcd', 'quantity' => 8, 'buy_cost' => 395.00, 'sell_price' => 450.00})
    @product3 = Product.new({ 'name' => 'apnea', 'description' => 'wetsuit', 'quantity' => 2, 'buy_cost' => 1250.00, 'sell_price' => 180.00})
    @product4 = Product.new({ 'name' => 'avanti', 'description' => 'fins', 'quantity' => 1, 'buy_cost' => 70.00, 'sell_price' => 85.00 })
    @product5 = Product.new({ 'name' => 'vyper', 'description' => 'computer', 'quantity' => 3, 'buy_cost' => 290.00, 'sell_price' => 320.00})
    @product6 = Product.new({ 'name' => 'd4', 'description' => 'computer', 'quantity' => 2, 'buy_cost' => 230.00, 'sell_price' => 265.00})
    @product6 = Product.new({ 'name' => 'xtx', 'description' => 'regulator', 'quantity' => 4, 'buy_cost' => 390.00, 'sell_price' => 450.00 })
    @product8 = Product.new({ 'name' => 'rk3', 'description' => 'fins', 'quantity' => 2, 'buy_cost' => 70.00, 'sell_price' => 95.00 })
  end

  def test_get_margin
    # binding.pry
    @product1.get_margin()
    assert_equal(95, @product1.get_margin)
  end

  def test_get_product_name
    @product1.name
    assert_equal('mk25', @product1.name)
  end

  def test_highlight_stock
    # binding.pry
    @product3.quantity()
    assert_equal('stock-level--low', @product3.stock_highlight)
  end


end
