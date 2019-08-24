class Product

  attr_reader :id, :name, :description, :quantity, :buy_cost, :sell_price

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @buy_cost = options['buy_cost'].to_f
    @sell_price = options['sell_price'].to_f
    # @manufacturer_id = options['manufacturer_id'].to_i
  end

  def get_margin()
    return @sell_price - @buy_cost
  end



end
