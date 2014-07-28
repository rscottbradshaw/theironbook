require 'rails_helper'

RSpec.describe "students/show", :type => :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :name => "Name",
      :description => "MyText",
      :year => 1,
      :class => "Class",
      :imgUrl => "Img Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Class/)
    expect(rendered).to match(/Img Url/)
  end
end
