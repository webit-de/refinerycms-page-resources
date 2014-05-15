require 'spec_helper'

module Refinery
  describe Page do
    let(:page) {FactoryGirl.create(:page)}
    let(:resources) {FactoryGirl.create_list(:resource, 2)}
    before do
      page.resources << resources.first
    end

    it "accepts resources being linked to it" do
      expect(page.resources.count).to eq(1)
    end

    it 'is linked to the resource' do
      expect(page.resources.first.id).to eq(resources[0].id)
    end

    it 'deletes a link to a resource' do


    end

    it 'deletes all resource links' do

    end
  end

end
