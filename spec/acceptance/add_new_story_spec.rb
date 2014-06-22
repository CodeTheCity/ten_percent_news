require 'spec_helper'

describe 'Reading page' do
  before :each do
    visit '/stories/new'
  end

  it "adds a new story" do
    expect(Story.count).to eql(0)
    fill_in 'story[title]', :with => 'My new story'
    click_button('Add')
    expect(Story.count).to eql(1)
  end
end
