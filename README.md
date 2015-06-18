# cap-driver-benchmarking

Benchmarking Capybara's drivers.

This is the test app I am building for Hashrocket's Summer Miniconf 2015. The purpose of this app is to test the performance of the drivers available for use with Capybara, as part of a larger talk about drivers.

### Setup

```
git clone http://github.com/jwworth/cap-driver-benchmarking.git
cd cap-driver-benchmarking
bundle install
rake db:migrate
rake
```

### Dependencies

This project measures the RackTest, Selenium, Capybara-webkit, and Poltergeist drivers. It is thus dependent on those projects, as well as:

* Firefox (Selenium)
* Phantom.js (Poltergeist)
* The Qt toolkit (Capybara-webkit)

### Hypothesis

I predict the following ranking, from fastest to slowest:

1. RackTest
2. Poltergeist
3. Capybara-webkit
4. Selenium

### Methodology

* Create a Rails app that measures how quickly each driver completes a series of Capybara steps (one block per driver)
* Run specs in random order
* Measure the time using RSpec profiler
* Test all the drivers, then test only the JavaScript drivers
* Analyze data

See `spec/features/` for more information.


### Results

The directory `results/` includes an output file for each spec, with ten runs recorded.

[CHARTS HERE](#)
