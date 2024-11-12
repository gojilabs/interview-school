# Goji Labs Interview Take-Home Project


## Overview
For our technical interview, we want you to build the foundation for a university course scheduling system. There should be teachers, subjects, classrooms, students, and another model called sections. A section represents a teacher teaching a subject in a specific classroom at a specfic time with students who attend the class. Think of it like the join model between all the other entities, and with specific times. Some sections are taught only on Monday, Wednesday, and Friday, others are only taught on Tuesdays and Thursdays, and some are every day. Sections typically are 50 minutes long, but they can also be 80 minutes. The earliest sections start at 7:30am and the latest ones end at 10pm.

## Goals
1. Students should be able to add/remove sections to their schedule
  - A student cannot be in two sections that overlap
  - For instance, if I add General Chemistry 1 to my schedule, and it's on MWF from 8:00 to 8:50am, I cannot enroll in any other sections between 8:00 and 8:50am on Mondays, Wednesdays, or Fridays.
2. Students should be able to download a PDF of their schedule.
  - For each section include subject, start time, end time, teacher name, and classroom name

## Guidelines
This is meant as a backend-only take home test project. You will not be scored on any styling or frontend choices. The entire application can be API-only, unless you're able to quickly set up a dashboard scaffold. Feel free to use Ruby on Rails, or NestJS, whichever you're most comfortable with. Please use the framework-default configuration, as we have developed templates internally for all projects. You will not be judged for using the default configurations, but please make sure to use Postgres as your database. If you want to set up a linter, that is always a good idea.

## Time Constraints
Do not spend more than 4 hours implementing the goals above. It's not mandatory that the goals above are 100% working, due to the time constraint, we're most interested in seeing your best work. Write this code as if you're contributing to a larger project with multiple developers who will critique your work. If you're running out of time and something isn't funcional yet, that's okay, make sure that whatever is functional is both complete and polished.
