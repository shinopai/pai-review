module ReviewHelper
  def show_user_score(n)
      content_tag(:i, nil, class: "fas fa-star text-yellow-300") * n
  end

  def show_score_avg(n)
    if n.kind_of?(Integer)
      content_tag(:i, nil, class: "fas fa-star text-yellow-300") * n +
      content_tag(:i, nil, class: "far fa-star text-yellow-300") * (5 - n) if 5 - n != 0
    else
      content_tag(:i, nil, class: "fas fa-star text-yellow-300") * n.to_i +
      content_tag(:i, nil, class: "fas fa-star-half-alt text-yellow-300") +
      content_tag(:i, nil, class: "far fa-star text-yellow-300") * (5 - n.ceil) if 5 - n.ceil != 0
    end
  end
end
