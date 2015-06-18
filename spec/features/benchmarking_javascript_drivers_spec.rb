require 'rails_helper'

describe 'benchmarking javascript drivers', js: true do
  def perform_steps
    visit root_path
    5.times do
      expect(page).to_not have_link 'Hide'
      expect(page).to have_link 'Show'

      click_link 'Show'
      expect(page).to have_content 'I appear!'
      expect(page).to have_link 'Hide'
      expect(page).to_not have_link 'Show'

      click_link 'Hide'
      expect(page).to_not have_content 'I appear!'
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
