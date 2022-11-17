class Person

    attr_reader :id
    attr_accessor :name, :age

    def initialize(name, age = "unknown", parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    
    def can_use_services?
        @parent_permission || is_of_age?
           
    end

    private

   def is_of_age?
    return true if @age >= 18

    false
  end
end
