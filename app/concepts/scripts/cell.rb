class Scripts::Cell < Cell::Concept

  def google_analytics
    @config = Config.first
    if @config.present?
      render
    end
  end

  def scripts
    @config = Config.first
    if @config.present?
      render
    end
  end

  def webmaster_verification
    @config = Config.first
    if @config.present?
      render
    end
  end

end
