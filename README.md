# Goji Labs Inteview Take-Home Project

## Development
Hello, for fast project up use docker & docker-compose
`docker-compose up` will up few services:
* App - rails backend API mode
* UI - VueJs frontend created with VueCLI at http://localhost:3000
* Postgres - Database

Then to run sh into running docker container run command `docker-compose exec [service_name] /bin/sh`
for ex: `docker-compose exec app /bin/sh` or `docker-compose exec app rails c`

Run tests `docker-compose run test rails test` 

## Overview
This application is meant to represent a school. There are teachers, subjects that they teach, and the relation between them. We want to add classrooms, students, and another model called sections. A section represents a teacher teaching a subject in a specific classroom at a specific time with students who attend the class. Think of it like the join model between all the other entities, and with specific times. Some sections are taught only on Monday, Wednesday, and Friday, others are only taught on Tuesdays and Thursdays, and some are every day. Sections typically are 50 minutes long, but they can also be 80 minutes. The earliest sections start at 7:30am and the latest ones end at 10pm.

## Goals
1. Students should be able to add/remove sections to their schedule
  - A student cannot be in two sections that overlap
  - For instance, if I add General Chemistry 1 to my schedule, and it's on MWF from 8:00 to 8:50am, I cannot enroll in any other sections between 8:00 and 8:50am on Mondays, Wednesdays, or Fridays.
2. Students should be able to download a PDF of their schedule.
  - For each section include subject, start time, end time, teacher name, and classroom name

## Guidelinesss
Develop this in your own fork. After you build your models, add a few different records for each model in seeds.rb or use either factories or fixtures. Use any frotend framework you like, or feel free to use server-side rendering. Refactor or remove any existing code necessary, the code currently here is a starting point. Do not bother setting up unnecessary systems right now, like Sidekiq or Devise. Assume that every browser user is a student, so you don't need to think about user management.

## Time Constraints
Do not spend more than 4 hours implementin  g the goals above. It's not mandatory that the goals above are 100% working, due to the time constraint, we're most interested in seeing your best work. Write this code as if you're contributing to a larger project with multiple developers who will critique your work. If you're running out of time and something isn't funcional yet, that's okay, make sure that whatever is functional is both complete and polished.

Thank you [Dusan Orlovic](https://blog.trk.in.rs/) for your work in building this

