# AklamioProject

In this public repository you will find tests for the Aklamio tasks.

# Requirements:

* Fork this repository https://github.com/LiviaGitHub/Aklamio
* Install bundler - gem install bundler
* Run `bundle install` to install the dependencies

# Continuos integration with Travis CI

* Go to https://travis-ci.org/LiviaGitHub/Aklamio

# Lint tool:

* Go to https://app.codacy.com/project/LiviaGitHub/Aklamio/dashboard.

# How run the Scenarios:

* Run `firefox=true bundle exec cucumber` open Firefox to execute the test suite
* Run `chrome=true bundle exec cucumber` open chrome to execute the test suite
* Run `cucumber` to execute the test suite without open the Browser

# To run the tests on BrowserStack:

* Create an account in https://automate.browserstack.com
* Go to https://automate.browserstack.com/dashboard
* Copy the Username and Access Keys
* Open config.yml File
* Replace the data in `Username and Access Keys`   
* Run `bundle exec rake parallel` to execute the test suite
