require "rails_helper"
feature "user searches store by zip code" do
  scenario "they visit root" do
    visit root_path
    VCR.use_cassette("features/search") do
      fill_in "search", with: "80204"
      click_on("Search")

      expect(current_path).to eq(search_path)

      within("#results") do
        expect(page).to have_content("7 Total Stores")
        expect(page).to have_content("BELMAR CO")
        expect(page).to have_content(3.84)
        expect(page).to have_content("CENTENNIAL")
      end
    end
  end
end
