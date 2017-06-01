require 'rails_helper'

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results

RSpec.feature "As a user" do
  scenario "they can search for nearby stores using their zipcode" do
    VCR.use_cassette("search_by_zip") do

      visit '/'

      fill_in "search-box", with: "80202"

      click_on "search"

      expect(current_path).to eq('/search')
      expect(page).to have_content("16 Total Stores")

      expect(page).to have_content("FIRST STORE DATA")
      expect(page).to have_content("LAST STORE DATA")

    end
  end
end
