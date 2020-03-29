Given("I am a registered user") do
  @registered_user = FactoryBot.create(:user, email: "tester@testdomain.test", password: "pa$$word")
end

Given("I am logged in") do
  visit root_path

  fill_in "user_email", with: "tester@testdomain.test"
  fill_in "user_password", with: "pa$$word"

  click_button "Log in"
end

Given("I have populated my inventory with several books") do
  FactoryBot.create(:book,
                    user: @registered_user,
                    name: "Don Quixote",
                    author: "Miguel de Cervantes")

  FactoryBot.create(:book,
                    user: @registered_user,
                    name: "Moby Dick",
                    author: "Herman Melville")

end

When("I visit the homepage") do
  visit root_path
end

Then("I should see the list of my books") do
  expect(page).to have_content("Don Quixote")
  expect(page).to have_content("Moby Dick")
end
