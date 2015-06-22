require 'rails_helper'

describe 'benchmarking javascript drivers:', js: true do
  def perform_steps
    visit root_path
    5.times do
      assert has_no_link? 'Hide'
      assert has_link? 'Show'

      click_link 'Show'
      assert has_text? 'I appear!'
      assert has_link? 'Hide'
      assert has_no_link? 'Show'

      click_link 'Hide'
      assert has_no_text? 'I appear!'
    end
  end

  specify 'selenium/firefox' do
    Capybara.current_driver = :selenium
    perform_steps
  end

  specify 'webkit' do
    Capybara.current_driver = :webkit
    perform_steps
  end

  specify 'selenium/chrome' do
    Capybara.current_driver = :chrome
    perform_steps
  end

  specify 'poltergeist' do
    Capybara.current_driver = :poltergeist
    perform_steps
  end

  after do
    Capybara.use_default_driver
  end
end
