require 'rails_helper'

describe 'benchmarking javascript drivers', js: true do
  def do_things
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

  it 'javascript driver: selenium' do
    Capybara.javascript_driver = :selenium
    do_things
    Capybara.use_default_driver
  end

  it 'javascript driver: webkit' do
    Capybara.javascript_driver = :webkit
    do_things
    Capybara.use_default_driver
  end

  it 'javascript driver: poltergeist' do
    Capybara.javascript_driver = :poltergeist
    do_things
    Capybara.use_default_driver
  end
end
