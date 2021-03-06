require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/home/index" do
  include HomeHelper

  before do
    login_and_assign
  end

  it "should render list of activities if it's not empty" do
    assign(:activities, [ FactoryGirl.create(:activity, :action => "updated", :subject => FactoryGirl.create(:account)) ])

    render
    view.should render_template(:partial => "_activity")
  end

  it "should render a message if there're no activities" do
    assign(:activities, [])

    render
    view.should_not render_template(:partial => "_activity")

    rendered.should include("No activity records found.")
  end
end

