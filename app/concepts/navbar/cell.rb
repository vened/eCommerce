class Navbar::Cell < Cell::Concept
  def show
    @config = Config.first
    @categories = Category.roots
    render
  end
end
