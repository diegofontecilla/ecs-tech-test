# ECSDigital Engineer in Tech Test

## Getting Started

On a machine with Docker installed: https://www.docker.com/get-started<br><br>

From terminal run:<br>
```
docker run -it -p 3000:3000 fontecilla/ecs-tech-test:latest
```
*OR*, if you are *not* using docker, *download* and *run* the original test repo manually,<br>
following the instructions for running the local version of the app:<br>
https://github.com/ecsdigital/qa-tech-test<br><br>

To run the solution on your machine, clone this repo<br>
and open a new terminal to the project root directory:<br><br>
```
sudo gem install bundler
bundle install
ruby src/test/e2e/automated_tests.rb
```

The tests will run in a new chrome tab controlled by automated test software.<br><br>

## Technologies used

- Ruby 2.2.3 - 2.5
- Selenium-Webdriver 3.141
- Chromedriver
- Xpath
