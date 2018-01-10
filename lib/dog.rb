require 'pry'
class Dog
  attr_accessor :id, :name, :breed

  def initialize(id: nil, name:, breed:)
    @id, @name, @breed = id, name, breed
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
        )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql =  <<-SQL
      DROP TABLE IF EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end

  def self.new_from_db(dog_row)
    dog = Dog.new(dog_row[0], row[1], row[2])
    dog.save
    dog
  end

  # def save
  #   # if self.id
  #   #   update.id
  #   # else
  #     sql = <<-SQL
  #       INSERT INTO dogs (name, breed)
  #       VALUES (?, ?)
  #     SQL
  #     # binding.pry
  #
  #     DB[:conn].execute(sql, self.name, self.breed)
  #     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  #   # end
  # end
  #
  # def update
  #   sql = "UPDATE dogs SET name = ?, breed = ? WHERE id = ?"
  #   DB[:conn].execute(sql, self.name, self.breed, self.id)
  # end
end
