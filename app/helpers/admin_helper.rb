module AdminHelper

  def admin_dropdown_items
    [
      { path: '', icon_class: 'fa-solid fa-wrench', menu_text: 'Add a dealer', type: 'drawer', id: 'new_dealer', view: 'dealers/new' }
    ]
  end

  def admin_dashboard_items

    @sellers = User.where(role: :seller).where(dealer_type: :tractors)
    @dealers = User.where(role: :dealer)

    [
      {text: 'Sellers', path: sellers_path, icon: 'fa-solid fa-tractor', count: @sellers.size, color: 'orange'},
      {text: 'Dealers', path: '', icon: 'fa-solid fa-wrench', count: @dealers.size, color: 'green'}
    ]
  end

end