# ECSDigital Engineer in Tech Test

## Getting Started

On a machine with Docker installed: https://www.docker.com/get-started<br><br>

*OR*, download and run the original test repo manually: https://github.com/ecsdigital/qa-tech-test<br><br>

To run the solution on your machine, download the files https://github.com/diegofontecilla/qa-tech-test-docker<br><br>

From terminal run:<br>
```
docker run -it -p 3000:3000 fontecilla/ecs-tech-test:latest
```
Open a new terminal to the project root directory<br>
```
bundle install
ruby src/test/e2e/automated_tests.rb
```
The tests will run in a new chrome tab controlled by automated test software.<br><br>

## Technologies used

- Ruby 2.2.3 - 2.5
- Selenium-Webdriver 3.141
- Chromedriver
- Xpath
