Rails.logger = Logger.new(STDOUT)

homer = Teacher.create(first_name: 'Homer', last_name: 'Simpson')
marge = Teacher.create(first_name: 'Marge', last_name: 'Simpson')
lisa = Teacher.create(first_name: 'Lisa', last_name: 'Simpson')

chemistry = Subject.create(name: 'Chemistry')
math = Subject.create(name: 'Math')
physics = Subject.create(name: 'Physics')
literature = Subject.create(name: 'Literature')
poetry = Subject.create(name: 'Poetry')

homer.subjects << chemistry
homer.subjects << poetry

marge.subjects << literature
marge.subjects << poetry

lisa.subjects << math
lisa.subjects << physics

classroom1 = Classroom.create(numeral: 404)
classroom2 = Classroom.create(numeral: 401)
classroom3 = Classroom.create(numeral: 504)
classroom4 = Classroom.create(numeral: 503)

kirk = Student.create(name: 'James', surname: 'Kirk', year: 1)
spock = Student.create(name: 'Spock', surname: 'Commander', year: 2)
mccoy = Student.create(name: 'Leonard', surname: 'McCoy', year: 3)

section1 = Section.create(week_days: 'M/W/F', time_start: Time.parse('09:00'), time_length: 50)
section1.teachers << lisa
section1.classrooms << classroom1
section1.subject = lisa.subjects.sample
section1.save

section2 = Section.create(week_days: 'M/T/W/TH/F', time_start: Time.parse('10:00'), time_length: 80)
section2.teachers << lisa
section2.teachers << homer
section2.classrooms << classroom2
section2.subject = poetry
section2.save



section_overlapping = Section.create(week_days: 'M/T/W/TH/F', time_start: Time.parse('09:00'), time_length: 80)
section_overlapping.teachers << homer
section_overlapping.classrooms << classroom4
section_overlapping.subject = chemistry
section_overlapping.save
