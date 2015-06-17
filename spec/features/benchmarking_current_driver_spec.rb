require 'rails_helper'

describe 'benchmarking current driver' do
  def do_things
    visit root_path
    5.times do
      find :css, 'h1'
      assert_text 'Capybara Driver Benchmarking!'
      click_button 'Here'
    end
  end

  it 'current driver: rack_test' do
    do_things
  end

  it 'current driver: selenium' do
    Capybara.current_driver = :selenium
    do_things
    Capybara.use_default_driver
  end

  it 'current driver: webkit' do
    Capybara.current_driver = :webkit
    do_things
    Capybara.use_default_driver
  end

  it 'current driver: poltergeist' do
    Capybara.current_driver = :poltergeist
    do_things
    Capybara.use_default_driver
  end
end
