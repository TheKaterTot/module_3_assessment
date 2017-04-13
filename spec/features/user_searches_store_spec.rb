require "rails_helper"
#As a user
#When I visit "/"
#And I fill in a search box with "80202" and click "search"
#Then my current path should be "/search" (ignoring params)
#And I should see stores within 25 miles of 80202
#And I should see a message that says "16 Total Stores"
#And I should see exactly 10 results
#And I should see the long name, city, distance, phone number
#and store type for each of the 10 results


feature "user searches store by zip code" do
  scenario "they visit root" do
    visit root_path
    VCR.use_cassette("features/search") do
      fill_in "search", with: "80204"
      click_on("Search")

      expect(current_path).to eq(search_path)
      within("#results") do
        expect(page).to have_content("7 Total Stores")
      end
      within("store-1") do
        expect(page).to have_content("BELMAR CO")
      end
      within("store-2") do
        expect(page).to have_content(3.84)
      end
      within("store-7") do
        expect(page).to have_content("CENTENNIAL")
      end
    end
  end
end
