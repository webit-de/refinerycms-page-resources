require 'spec_helper'

module Refinery
  describe Page do
    it "can have resources added" do
      page = FactoryGirl.create(:page)
      page.resources.count.should eq(0)

      page.resources << FactoryGirl.create(:resource)
      page.resources.count.should eq(1)
    end

    describe "#resources_attributes=" do
      it "adds resources" do
        page = FactoryGirl.create(:page)
        resource = FactoryGirl.create(:resource)

        page.resources.count.should == 0
        page.update_attributes({:resources_attributes => {"0" => {"id" => resource.id}}})

        page.resources.count.should == 1
      end

      it "deletes specific resources" do
        page = FactoryGirl.create(:page)
        resources = [FactoryGirl.create(:resource), FactoryGirl.create(:resource)]
        page.resources = resources

        page.update_attributes(:resources_attributes => {
          "0" => {
            "id" => resources.first.id.to_s,
            "resource_page_id" => page.page_resources.first.id,
          },
        })

        page.resources.should eq([resources.first])
      end

      it "deletes all resources" do
        page = FactoryGirl.create(:page)
        resources = [FactoryGirl.create(:resource), FactoryGirl.create(:resource)]
        page.resources = resources

        page.update_attributes(:resources_attributes => {"0" => {"id"=>""}})

        page.resources.should be_empty
      end

      it "reorders resources" do
        page = FactoryGirl.create(:page)
        resources = [FactoryGirl.create(:resource), FactoryGirl.create(:resource)]
        page.resources = resources

        page.update_attributes(:resources_attributes => {
          "0" => {
            "id" => resources.second.id,
            "resource_page_id" => page.page_resources.second.id,
          },
          "1" => {
            "id" => resources.first.id,
            "resource_page_id" => page.page_resources.first.id,
          },
        })

        page.resources.should eq([resources.second, resources.first])
      end
    end
  end
end
