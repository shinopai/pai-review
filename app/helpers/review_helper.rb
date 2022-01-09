module ReviewHelper
  def show_user_score(n)
      content_tag(:i, nil, class: "fas fa-star text-yellow-300") * n
  end
end
