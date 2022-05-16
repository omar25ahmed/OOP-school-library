module CreatePerson
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    selected_person = gets.chomp
    case selected_person
    when '1'
      puts 'Age: '
      age = gets.chomp
      puts 'Name: '
      name = gets.chomp
      puts 'Has parent permission [Y/N]: '
      parent_permission = gets.chomp
      puts 'Classroom: '
      classroom = gets.chomp
      @persons << Student.new(age, name, parent_permission, classroom)
      puts 'Person Created succesfully'
    when '2'
      puts 'Age: '
      age = gets.chomp
      puts 'Name: '
      name = gets.chomp
      puts 'Specialization: '
      specialization = gets.chomp
      @persons << Teacher.new(age, name, specialization)
      puts 'Person Created succesfully'
    else
      puts 'Invalid selection'
    end
  end
end
