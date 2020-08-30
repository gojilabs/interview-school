# School Rails App

This is Rails app for the task

> I want you to create a project from scratch. We want to represent a school, so there are teachers, classes, classrooms, and students. Students have many classes, teachers have many classes, and a classroom has many classes. I want to be able to edit, add, and remove teachers, students, and classes.

> I know these are very basic requirements, but please use your best judgement if anything is confusing. Feel free to use rails scaffolds to build this representation quickly, the front end can be simple and server rendered. Don’t include anything you don’t need, like devise, pundit, or sidekiq for now. I want to see how you build your models and controllers, and I want to see your best work. We will extend the functionality of this in our next interview. And please don’t spend more than 4 hours, if you cannot finish it in this time that’s ok.

I created model for Subject, Teacher and TeacherSubject.
Class is reserved name, so I choose Subject and keep using that in views (also
renamed for activerecord in `config/locales/en.yml`).

I added database validations, for example `null:false` for subjects.name, uniq
index for TeacherSubject.

On update Subject you can see select multiple so user can select/deselect
teachers. In controller I convert those teacher_ids to
teacher_subjects_attributes.

I prefer not to add logic in controller but this is just example how to use
select multiple.

On Teachers show page you can see ajax way of CRUD actions. I tested it using
system test.

Adding classrooms and students tables will just increase the size, but nothing
interesting could be created in this first 4 hours. In another 4 hours I would
like to add CRUD for students using Vue.js.

# Development

Standard Rails commands

```
rails db:setup
rails s
```

Run tests

```
rails test
```

Run system tests in browser

```
rails test:system

# run specific test
rails test test/system/subjects_test.rb:15
```
