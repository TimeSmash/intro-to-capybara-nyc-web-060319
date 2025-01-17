require 'spec_helper'

describe "GET '/' - Greeting Form" do
  # Code from previous example
  it 'welcomes the user' do
    visit '/'
    expect(page.body).to include("Welcome!")
  end

#    ^
#   The `visit` method navigates the test's browser to a specific URL. It is
# equivalent to a user typing a URL into their browser's location bar. The
# argument it accepts is a string for the URL you want to test. Since we want to
# test our `'/'` root URL, we say `visit '/'`,

  # New test
  it 'has a greeting form with a user_name field' do
    visit '/'
                                    #   ,,----# Page is an object representing the user looking at the page in their browser ?All HTML on page?
    expect(page).to have_selector("form") # A selector is equal to an element 
    expect(page).to have_field(:user_name) # Checks if <input> has name or id = :user_name
  end
end

describe "POST '/greet' - User Greeting" do
  it 'greets the user personally based on their user_name in the form' do
    visit '/'

    fill_in(:user_name, :with => "Avi")
    click_button "Submit"

    expect(page).to have_text("Hi Avi, nice to meet you!")
  end
end