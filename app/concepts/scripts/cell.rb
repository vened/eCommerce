class Scripts::Cell < Cell::Concept

  def google_analytics
    @config = Config.first
    render
  end

  def scripts
    @config = Config.first
    render
  end

end
