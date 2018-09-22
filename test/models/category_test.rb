require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup 
  # this method will run before every test
  
    @category = Category.new(name: "sports")
    # this is the initiation of an instance variable
    # this is not going to hit your database. it will work only in a test database
    # it will get rid of all the date after the tests
  end
  
  test "category should be valid" do
  # this is just a name for the test
  
    assert @category.valid? # assert sprawdza czy dany warunek jest true???
  end
  
  test "name should be valid" do
    @category.name = " "
    assert_not @category.valid? # assert_not expect "false" value
  end
  
  test "name should be uniqe" do
    @category.save # first, we have to save what we created in the setup
    category2 = Category.new(name: "sports") # trying to create a new category
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "a" * 2
    assert_not @category.valid?
  end
  
end