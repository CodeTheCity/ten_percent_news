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

  it "displays welcome message" do
    expect(page).to have_css('h1', text: 'Welcome')
  end

  context "list of stories" do
    it "displays all stories" do
      expect(page).to have_css('.story', count: 2)
    end
  end
end
