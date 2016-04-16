require 'test_helper'

class NavbarConceptTest < Cell::TestCase
  test "show" do
    html = concept("navbar/cell").(:show)
    assert html.match /<p>/
  end


end
