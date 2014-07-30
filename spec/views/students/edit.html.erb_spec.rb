require 'rails_helper'

RSpec.describe "students/edit", :type => :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :name => "MyString",
      :description => "MyText",
      :year => 1,
<<<<<<< HEAD
      :class => "MyString",
=======
      :cohort => "MyString",
>>>>>>> i think its fixed
      :imgUrl => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input#student_name[name=?]", "student[name]"

      assert_select "textarea#student_description[name=?]", "student[description]"

      assert_select "input#student_year[name=?]", "student[year]"

<<<<<<< HEAD
      assert_select "input#student_class[name=?]", "student[class]"
=======
      assert_select "input#student_cohort[name=?]", "student[cohort]"
>>>>>>> i think its fixed

      assert_select "input#student_imgUrl[name=?]", "student[imgUrl]"
    end
  end
end
