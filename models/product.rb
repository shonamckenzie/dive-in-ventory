require_relative('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor :name, :description, :quantity, :buy_cost, :sell_price, :image, :manufacturer_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @buy_cost = options['buy_cost'].to_f
    @sell_price = options['sell_price'].to_f
    @image = options['image']
    @manufacturer_id = options['manufacturer_id'].to_i
  end

  def get_margin()
    @sell_price - @buy_cost
  end


  def save
    sql = "INSERT INTO products (
    name,
    description,
    quantity,
    buy_cost,
    sell_price,
    image,
    manufacturer_id
    ) VALUES (
      $1, $2, $3, $4, $5, $6, $7
      )
      RETURNING id"
    values = [@name, @description, @quantity, @buy_cost, @sell_price, @image, @manufacturer_id]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def delete
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def manufacturer()
    manufacturer = Manufacturer.find(@manufacturer_id)
    return manufacturer
  end

  def update
    sql = "UPDATE products SET (
    name,
    description,
    quantity,
    buy_cost,
    sell_price,
    manufacturer_id
    ) =
    (
      $1, $2, $3, $4, $5, $6
      ) WHERE id = $7"
    values = [@name, @description, @quantity, @buy_cost, @sell_price, @manufacturer_id, @id]
    SqlRunner.run(sql, values)
  end

  def stock_highlight
    if @quantity == 0
      'stock-level--critical'
    elsif @quantity <= 3
      'stock-level--low'
    elsif @quantity > 3
      'stock-level--ok'
    end
  end


  def self.all
    sql = "SELECT * FROM products ORDER BY description"
    results = SqlRunner.run(sql)
    return results.map{ |hash| Product.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    product = Product.new(result)
    return product
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

end
