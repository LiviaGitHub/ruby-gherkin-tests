# History

* Frameworks to structure the test scenarios were used:
cucumber - capybara - selenium - webdriver.

* Framework for reuse of code, creation of the page object model: site_prism.

* The tests are running in 5 different browsers, using for this:
browserstack-local and parallel.
  - browser: "chrome"
  - browser: "firefox"
  - browser: "internet explorer"
  browser_version: "11"
  - browser: "edge"
  - device: "iPhone 8 Plus"

* The project has continuous integration, using for this: Travis.

* The lint tool chosen was: rubocop

* I chose cucumber as a framework because I believe it is an excellent tool
for documentation, structuring and reporting of tests.
