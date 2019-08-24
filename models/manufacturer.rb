require_relative('../db/sql_runner')

class Manufacturer

  attr_accessor :name, :country, :contact, :rating
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
    @contact = options['contact']
    @rating = options['rating'].to_i
  end


  def save()
    sql = "INSERT INTO manufacturers (
    name,
    country,
    contact,
    rating
    )
    VALUES(
      $1, $2, $3, $4
      )
      RETURNING id"
    values = [@name, @country, @contact, @rating]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all

  end

  def self.find(id)

  end

  def self.delete_all

  end

end
