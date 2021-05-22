# url-shortener

![actions](https://github.com/fiinnnn/url-shortener/actions/workflows/test.yml/badge.svg)
[![codecov](https://codecov.io/gh/fiinnnn/url-shortener/branch/master/graph/badge.svg?token=MFNDULY2AL)](https://codecov.io/gh/fiinnnn/url-shortener)

## Installing

### Requirements
Ensure the following dependencies are installed:
* [rbenv](https://github.com/rbenv/rbenv)
* [rbenv-vars](https://github.com/rbenv/rbenv-vars)
* [ruby-build](https://github.com/rbenv/ruby-build)
* [docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/install/)

### Guide
Install the required ruby version:
```
$ rbenv install
```

Once it's installed, copy the .rbenv-vars template and edit if necessary:
```
$ cp sample.rbenv-vars .rbenv-vars
```

Assuming the docker service is already running, start the database container:
```
$ docker-compose up -d
```

Now the database can be set up:
```
$ rails db:create
$ rails db:migrate
```

Finally rails can be started:
```
$ rails s
```

## Running tests
This project uses [rspec](https://rspec.info/) for testing.
If the rspec gem is installed, tests can be run using:
```
$ rspec
```
