# cap-driver-benchmarking

Benchmarking Capybara's drivers.

This is the test app I am building for Hashrocket's Summer Miniconf 2015. The purpose of this app is to test the performance of the drivers available for use with Capybara, as part of a broader talk about drivers.

### Dependencies

This project measures the RackTest, Selenium, Capybara-webkit, and Poltergeist drivers. It is thus dependent on those gems, as well as:

* [Chrome Webdriver](https://code.google.com/p/selenium/wiki/ChromeDriver)
* [Firefox](https://www.mozilla.org/en-US/firefox/new/)
* [GNUplot](http://www.gnuplot.info/)
* [PhantomJS](http://phantomjs.org/)
* [The Qt Port of Webkit](http://trac.webkit.org/wiki/QtWebKit)

### Setup

```
git clone http://github.com/jwworth/cap-driver-benchmarking.git
cd cap-driver-benchmarking
bundle install
rake db:create db:migrate
rake
```

Validate that all tests are passing, which indicates you have all the dependencies. Activate the custom profiler by adding `--format PlotFormatter` to `.rspec`.

### Hypothesis

I predict the following ranking, from fastest to slowest:

1. RackTest
2. Poltergeist
3. Capybara-webkit
4. Selenium/Chrome
5. Selenium/Firefox

### Methodology

* Create a Rails app that measures how quickly each driver completes a series of Capybara methods
* Test one driver in each block, in random order
* Measure the time using RSpec profiler
* Run tests 'cold' (no browsers already running)
* Test all the drivers, then test the JavaScript drivers by themselves
* Analyze

See `spec/features/` to see the implementation.

### Results

#### Current Driver, 5 Iterations:

![Chart](https://raw.githubusercontent.com/jwworth/cap-driver-benchmarking/master/results/plot_1434987349.png)

#### Current Driver, 100 Iterations:

![Chart](https://raw.githubusercontent.com/jwworth/cap-driver-benchmarking/master/results/plot_1434987386.png)

#### JavaScript Driver, 5 Iterations:

![Chart](https://raw.githubusercontent.com/jwworth/cap-driver-benchmarking/master/results/plot_1434987412.png)

#### JavaScript Driver, 100 Iterations:

![Chart](https://raw.githubusercontent.com/jwworth/cap-driver-benchmarking/master/results/plot_1434987465.png)

### License

MIT
