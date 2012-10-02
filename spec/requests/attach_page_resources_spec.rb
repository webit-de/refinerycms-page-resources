require "spec_helper"

describe "attach page resources" do
  login_refinery_user

  before(:each) do
    Factory(:page)

    visit refinery.admin_pages_path

    click_link "Edit this page"
  end

  it "shows resources tab" do
    within "#custom_resources_tab" do
      page.should have_content("resources")
    end
  end

  # This spec actually is broken in a way because Add resource link would
  # be visible to capybara even if we don't click on resources tab.
  it "shows add resource link" do
    within "#custom_resources_tab" do
      click_link "resources"
    end

    page.should have_content("Add resource")
  end
end
