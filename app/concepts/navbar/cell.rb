class Navbar::Cell < Cell::Concept
  def show
    @categories = Category.roots
    render
  end
end
