require "test_helper"

class ArticlesTest < ActiveSupport::TestCase
  test "draft? returns true for draft articles" do
    assert articles(:draft).draft?
  end
  
  test "draft? returns false for published articles" do
    refute articles(:published).draft?
  end
  
  test "draft? returns false for scheduled articles" do
    refute articles(:scheduled).draft?
  end

  test "published? returns true for published articles" do
    assert articles(:published).published?  
  end
  
  test "published? returns false for draft articles" do
    refute articles(:draft).published?
  end


  test "published? returns false for scheduled articles" do
    refute articles(:scheduled).published?
  end
  
  test "scheduled? returns true for scheduled articles" do
    assert articles(:scheduled).scheduled?  
  end
  
  test "scheduled? returns false for draft articles" do
    refute articles(:draft).scheduled?
  end


  test "scheduled? returns false for published articles" do
    refute articles(:published).scheduled?
  end

  
end
