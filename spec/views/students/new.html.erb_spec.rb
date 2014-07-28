require 'rails_helper'

RSpec.describe "students/new", :type => :view do
  before(:each) do
    assign(:student, Student.new(
      :name => "MyString",
      :description => "MyText",
      :year => 1,
      :class => "MyString",
      :imgUrl => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input#student_name[name=?]", "student[name]"

      assert_select "textarea#student_description[name=?]", "student[description]"

      assert_select "input#student_year[name=?]", "student[year]"

      assert_select "input#student_class[name=?]", "student[class]"

      assert_select "input#student_imgUrl[name=?]", "student[imgUrl]"
    end
  end
end
