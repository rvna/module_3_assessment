require 'rails_helper'

RSpec.describe 'A user searches for their zip code' do
  it "sees the stores within 25 miles" do
    visit '/'         
    fill_in 'zip', with: '80202'
    click_on 'Search'
    
    expect(current_path).to eq('/search')
    expect(page).to have_content('17 Total Stores')
    expect(page).to have_css('.store', count: 15)
    within ('.store:first') do
      expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("Denver")
      expect(page).to have_content("3.25")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Mobile")
    end
  end
end