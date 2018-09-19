class Dog 
attr_accessor :id, :name, :breed 

def initialize (id = nil, name, breed)
  @name = name 
  @breed = breed 
  @id = id 
end 

def self.create_table 
  sql = <<-SQL 
    create table if not exists dogs (
      id primary key integer 
      name text 
      breed text
    ) SQL
  DB[:conn].execute(sql)
end 

def self.drop_table 
  DB[:conn].execute('drop table if exists dogs')
end

end 