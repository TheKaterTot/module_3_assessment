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
    store = Store.new(name: "Store 100",
                         city: "Denver",
                         distance: 1.0,
                         phone_number: "123-456-7890",
                         store_type: "big",
                         zip: "80204")

    visit root_path
    VCR.use_cassette("features/search") do
      fill_in "Search", with: "80204"

      expect(current_path).to eq(search_path)
      within("#results") do
        expect(page).to have_content("10 Total Stores")
      end
    end
  end
end
