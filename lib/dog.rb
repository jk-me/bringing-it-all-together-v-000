class Dog
attr_accessor :id, :name, :breed

  def initialize (hash)
    @name = hash[:name]
    @breed = hash[:breed]
    @id = hash[:id]
  end

  def self.create_table
    sql = <<-pie
      create table if not exists dogs (
        id integer primary key,
        name text,
        breed text)
      pie
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute('drop table if exists dogs')
  end

  def self.new_from_db(row)
    id = row[0]
    name = row[1]
    breed = row[2]
    self.new(id,name,breed) 
  end 

  def self.find_by_name(name)
    sql = "select * from dogs where name = ?"
    self.new_from_db(DB[:conn].execute(sql,name).first)
  end 

  def update

  end 

  def save 

  end

end
