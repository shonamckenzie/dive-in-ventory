class Manufacturer

  attr_reader :name, :country, :contact, :rating, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
    @contact = options['contact']
    @rating = options['rating'].to_i
  end


end
