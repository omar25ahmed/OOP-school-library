module CreatePerson
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]'

    json = File.read('people.json')
    people = File.zero?('people.json') ? [] : JSON.parse(json)

    selected_person = gets.chomp
    case selected_person
    when '1'
      puts 'Age: '
      age = gets.chomp
      puts 'Name: '
      name = gets.chomp
      puts 'Has parent permission [Y/N]: '
      parent_permission = gets.chomp
      puts 'Student id: '
      id = gets.chomp
      student = Student.new(age, name, id, parent_permission)
      people << student.attrs
      File.write('people.json', JSON.pretty_generate(people))
      @persons << student
      puts 'Person Created succesfully'
    when '2'
      puts 'Age: '
      age = gets.chomp
      puts 'Name: '
      name = gets.chomp
      puts 'ID: '
      id = gets.chomp
      puts 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, name, id, specialization)
      people << teacher.attrs
      File.write('people.json', JSON.pretty_generate(people))
      @persons << teacher
      puts 'Person Created succesfully'
    else
      puts 'Invalid selection'
    end
  end
end
