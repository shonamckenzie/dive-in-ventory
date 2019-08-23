require('minitest')
require('minitest/autorun')
require('minitest/rg')
require_relative('../models/manufacturer')

class ManufacturerTest < MiniTest::Test

  def setup
    @manufacturer1 = Manufacturer.new({ 'name' => 'scubapro', 'country' => 'usa', 'contact' => 'jeff', 'rating' => '5' })
    @manufacturer2 = Manufacturer.new({ 'name' => 'mares', 'country' => 'italy', 'contact' => 'lucio', 'rating' => '4' })
    @manufacturer3 = Manufacturer.new({ 'name' => 'suunto', 'country' => 'finland', 'contact' => 'elena', 'rating' => '5' })
    @manufacturer4 = Manufacturer.new({ 'name' => 'apeks', 'country' => 'uk', 'contact' => 'elke', 'rating' => '4' })
  end

  def test_get_manufacturer
    @manufacturer1.name()
    assert_equal('scubapro', @manufacturer1.name)
  end









end
