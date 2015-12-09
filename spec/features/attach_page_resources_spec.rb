require "spec_helper"

describe "attach page resources", type: :feature do
  refinery_login_with :refinery_user
  let(:page_resources_tab_id) { "#custom_#{::I18n.t(:'refinery.plugins.refinery_page_resources.tab_name')}_tab"  }

  before(:each) do
    FactoryGirl.create(:page)

    visit refinery.admin_pages_path

    click_link "Edit this page"
  end

  it "shows resources tab" do
    within page_resources_tab_id do
      page.should have_content("Resources")
    end
  end

  # This spec actually is broken in a way because Add resource link would
  # be visible to capybara even if we don't click on resources tab.
  it "shows add resource link" do
    within page_resources_tab_id do
      click_link "Resources"
    end

    page.should have_content("Add Resource")
  end
end
