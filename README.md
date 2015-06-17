# cap-driver-benchmarking

Benchmarking Capybara's drivers.

This is the test app I am building for Hashrocket's Summer Miniconf 2015.

### Setup

```
git clone http://github.com/jwworth/cap-driver-benchmarking.git
cd cap-driver-benchmarking
bundle install
rake db:migrate
rake
```

### Dependencies

This project measures the RackTest, Selenium, Capybara-webkit, and Poltergeist drivers. It is thus dependent on those projects, as well as Firefox (Selenium), the Qt toolkit (Capybara-webkit), and Phantom.js (Poltergeist).

### Hypothesis

I predict the following ranking from fastest to slowest: RackTest, Poltergeist, Capybara-webkit, Selenium.

### Methodology

* Create a Rails app that measures how quickly each driver completes a series of Capybara steps (one block per driver)
* Run specs in random order
* Measure the time using `rspec -p n`
* Test all the drivers, then test the JavaScript drivers
* Analyze data

Check out the `spec/features/` directory to see how I implemented the tests.


### Results

TBD
