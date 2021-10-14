# Mindr Interview Project

## Overview

This application is meant to represent a school. There are teachers, subjects that they teach, and the relation between them. We want to add classrooms, students, and another model called sections. A section represents a teacher teaching a subject in a specific classroom at a specfic time with students who attend the class. Think of it like the join model between all the other entities, and with specific times. Some sections are taught only on Monday, Wednesday, and Friday, others are only taught on Tuesdays and Thursdays, and some are every day. Sections typically are 50 minutes long, but they can also be 80 minutes. The earliest sections start at 7:30am and the latest ones end at 10pm.

## Before the interview

Before the interview begins, it would be helpful to setup the development environment in advance. You can use whatever editor you prefer.

### Using Docker (recommended)

To avoid issues setting up your environment, we recommend that you use Docker.

1. Build the image. This can take up to 10 minutes to build, and the image is quite large so feel free to delete the image after the interview.

```
docker build . -t mindr-interview-school
```

2. Start the container

```
docker run --name interview-school -v "`pwd`:/app" --publish "3000:3000" interview-school
```

3. You should be able to visit the app via http://localhost:3000

#### Useful commands

_Stop container_: `docker container stop interview-school`
_Start container_: `docker container start interview-school`
_Run a migration_: `docker container exec interview-school ./bin/rails db:migrate`
_Update FE deps_: `docker container exec interview-school yarn install`

### Manual set up

If you prefer you can setup the repository directly on your computer.

1. Download and install Ruby 2.6.3
2. Install bundler

```
gem install bundler:2.0.2
```

3. Install yarn

```
https://classic.yarnpkg.com/lang/en/docs/install/
```

4. Install dependencies

```
bundle install
yarn install
```

5. Setup database

```
./bin/rails db:setup
./bin/rails db:seed
```

## During the interview

You will pair with a Mindr engineer to complete some tasks that you will likely see on an average day at Mindr. There are no right/wrong answers and we will keep going until the time runs out so don't worry if you don't finish everything.

Thank you [Goji Labs](https://gojilabs.com/) for donating their coding test.
