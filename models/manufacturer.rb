require_relative('../db/sql_runner')

class Manufacturer

  attr_accessor :name, :country, :contact, :rating, :phone, :notes
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
    @contact = options['contact']
    @phone = options['phone']
    @notes = options['notes']
    @rating = options['rating'].to_i
  end


  def save()
    sql = "INSERT INTO manufacturers (
    name,
    country,
    contact,
    phone,
    notes,
    rating
    )
    VALUES(
      $1, $2, $3, $4, $5, $6
      )
      RETURNING id"
    values = [@name, @country, @contact, @phone, @notes, @rating]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id']
  end

  def delete
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE manufacturers SET (
    name,
    country,
    contact,
    rating
    ) = (
      $1, $2, $3, $4
      ) WHERE id = $5"
    values = [@name, @country, @contact, @phone, @notes, @rating, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run(sql)
    return results.map{ |hash| Manufacturer.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    manufacturer = Manufacturer.new(result)
    return manufacturer
  end

  def self.delete_all
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

end
