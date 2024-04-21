module ArticlesHelper
  include Pagy::Frontend

  def random_bulma_color
    colors = %w[ primary link info success warning danger]
    colors.sample
  end


end
