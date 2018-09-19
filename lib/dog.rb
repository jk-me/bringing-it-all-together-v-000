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

end
