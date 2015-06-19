require 'rails_helper'

describe 'benchmarking current driver' do
  def perform_steps
    visit root_path
    5.times do
      find :css, 'h1'
      assert_text 'Capybara Driver Benchmarking!'
      click_button 'Noop'
    end
  end

  specify 'with rack_test' do
    perform_steps
  end

  specify 'with selenium' do
    Capybara.current_driver = :selenium
    perform_steps
  end

  specify 'with selenium chrome' do
    Capybara.current_driver = :chrome
    perform_steps
  end

  specify 'with webkit' do
    Capybara.current_driver = :webkit
    perform_steps
  end

  specify 'with poltergeist' do
    Capybara.current_driver = :poltergeist
    perform_steps
  end

  after do
    Capybara.use_default_driver
  end
end
