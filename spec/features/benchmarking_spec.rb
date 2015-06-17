require 'rails_helper'

describe 'benchmarking' do
  def do_things
    visit root_path
    1.times do
      find :css, 'h1'
      assert_text 'Capybara Driver Benchmarking!'
      click_button 'Here'
    end
  end

  it 'does everything with rack_test' do
    do_things
  end

  it 'does everything with selenium' do
    Capybara.current_driver = :selenium
    do_things
    Capybara.use_default_driver
  end

  it 'does everthing with webkit' do
    Capybara.current_driver = :webkit
    do_things
    Capybara.use_default_driver
  end

  it 'does everything with poltergeist' do
    Capybara.current_driver = :poltergeist
    do_things
    Capybara.use_default_driver
  end
end
