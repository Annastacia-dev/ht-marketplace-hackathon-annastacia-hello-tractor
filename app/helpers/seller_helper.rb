module SellerHelper

  def seller_dropdown_items
    [
      { path: new_tractor_listing_tractor_path(current_user.tractor_listing ), icon_class: 'fa-solid fa-tractor', menu_text: 'Add a tractor', type: 'drawer', id: 'new_tractor', view: 'tractors/new' }
    ]
  end

  def seller_dashboard_items

    listing = current_user.tractor_listing

    @for_sale_tractors = listing.tractors.where(selling_status: :for_sale)
    @sold_tractors = listing.tractors.where(selling_status: :sold)

    [
      {text: 'Tractors for sale', path: tractor_listing_path(listing), icon: 'fa-solid fa-tractor', count: @for_sale_tractors.size, color: 'orange'},
      {text: 'Sold Tractors', path: tractor_listing_path(listing), icon: 'fa-solid fa-money-bill-wave', count: @sold_tractors.size, color: 'green'}
    ]
  end

end