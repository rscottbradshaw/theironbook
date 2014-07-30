require 'rails_helper'

RSpec.describe "students/index", :type => :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :name => "Name",
        :description => "MyText",
        :year => 1,
<<<<<<< HEAD
        :class => "Class",
=======
        :cohort => "Cohort",
>>>>>>> i think its fixed
        :imgUrl => "Img Url"
      ),
      Student.create!(
        :name => "Name",
        :description => "MyText",
        :year => 1,
<<<<<<< HEAD
        :class => "Class",
=======
        :cohort => "Cohort",
>>>>>>> i think its fixed
        :imgUrl => "Img Url"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
<<<<<<< HEAD
    assert_select "tr>td", :text => "Class".to_s, :count => 2
=======
    assert_select "tr>td", :text => "Cohort".to_s, :count => 2
>>>>>>> i think its fixed
    assert_select "tr>td", :text => "Img Url".to_s, :count => 2
  end
end
