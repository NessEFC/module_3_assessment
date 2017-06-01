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

      fill_in "search_box", with: "80202"

      click_on "search"

      expect(current_path).to eq('/search')
      expect(page).to have_content("16 Total Stores")

      expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("DENVER")
      expect(page).to have_content("3.45")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Mobile SAS")

      expect(page).to have_content("BEST BUY - SOUTHGLENN")
      expect(page).to have_content("CENTENNIAL")
      expect(page).to have_content("11.02")
      expect(page).to have_content("303-797-3246")
      expect(page).to have_content("Big Box")
    end
  end
end
