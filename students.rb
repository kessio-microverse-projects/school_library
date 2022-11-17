class students
    attr_accessor :classroom

    def classroom(classroom)
        @classroom = classroom
        classroom.students << self unless classroom.students.include?(self)
    end
end