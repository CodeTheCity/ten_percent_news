require 'spec_helper'

describe 'Reading page' do
  before :each do
    Story.create!(title: 'Test')
    Story.create!(title: 'Test2')

    visit '/'
  end

  after :each do
    Story.destroy_all
  end

  it "displays title" do
    expect(page).to have_css('h1', text: 'Ten Percent News')
  end

  context "list of stories" do
    it "displays all stories" do
      expect(page).to have_css('.story', count: 2)
    end

    it "allows a new story to be added" do
      expect(page).to have_css('a.add_story', text: 'Add story')
    end
  end
end
