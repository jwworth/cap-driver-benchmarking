# cap-driver-benchmarking

This is the test app I built for a talk at Hashrocket's Summer Miniconf 2015. Its purpose is to benchmark the performance of the drivers available for use with Capybara.

### Dependencies

This app benchmarks the RackTest, Selenium, Capybara-webkit, and Poltergeist drivers. It is thus dependent on those gems, and also:

* [Chrome Webdriver](https://code.google.com/p/selenium/wiki/ChromeDriver)
* [Firefox](https://www.mozilla.org/en-US/firefox/new/)
* [GNUplot](http://www.gnuplot.info/)
* [PhantomJS](http://phantomjs.org/)
* [The Qt Port of Webkit](http://trac.webkit.org/wiki/QtWebKit)

### Setup

Install the dependencies listed above, then:

```
git clone http://github.com/jwworth/cap-driver-benchmarking.git
cd cap-driver-benchmarking
bundle install
rake db:create db:migrate
rake
```

When all the dependencies are installed correctly, the tests should pass.

A custom profiler builds `.png` charts. Activate it by uncommenting `--format PlotFormatter` inside `.rspec`.

### Hypothesis

I predicted the following performance ranking, from fastest to slowest:

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

See `spec/features/` for more details on the implementation.

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
