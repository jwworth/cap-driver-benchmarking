require 'capybara/rspec'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

class PlotFormatter < RSpec::Core::Formatters::ProfileFormatter
  RSpec::Core::Formatters.register self, :dump_profile
  def dump_profile(profile)
    data_file_name = 'results/plot.dat'

    File.open data_file_name, 'w' do |file|
      profile.slowest_examples.each.with_index do |example, i|
        file.puts [i, %["#{example.description}"], example.execution_result.run_time].join("\t")
      end
    end

    puts 'Generating GNUplot chart...'
    system "gnuplot -e '%s'" % <<-GNUPLOT.gsub("\n", ';')
      set terminal png
      set output "results/plot.png"
      set boxwidth 0.5
      set style fill solid
      plot "#{data_file_name}" using 1:3:xtic(2) with boxes
    GNUPLOT
    puts 'GNUplot chart generated to results/.'

    system "rm results/plot.dat"
  end
end
