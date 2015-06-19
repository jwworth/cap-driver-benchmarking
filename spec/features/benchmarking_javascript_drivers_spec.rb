require 'rails_helper'

describe 'benchmarking javascript drivers', js: true do
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

  specify 'with selenium' do
    Capybara.javascript_driver = :selenium
    perform_steps
  end

  specify 'with webkit' do
    Capybara.javascript_driver = :webkit
    perform_steps
  end

  specify 'with poltergeist' do
    Capybara.javascript_driver = :poltergeist
    perform_steps
  end

  after do
    Capybara.use_default_driver
  end
end