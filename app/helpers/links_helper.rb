module LinksHelper
  def sidebar_items
    items  =  [
      {
        menu_text: current_user.buyer? ? 'Home' : 'Dashboard',
        icon_class: 'fa-solid fa-house',
        path: root_path
      }
    ]

    if current_user.seller?
      seller_sidebar_links(items)
    end

    if current_user.admin?
      admin_sidebar_links(items)
    end

    items.push(
      path: '',
      icon_class: 'fa-solid fa-user',
      menu_text: 'Profile',
      children: [
        { path: edit_user_registration_path, icon_class: 'fa-solid fa-pencil', menu_text: 'Edit' },
        { path: destroy_user_session_path, icon_class: 'fa-solid fa-right-from-bracket', menu_text: 'Logout', type: 'button', method: :delete },
        # { path:  registration_path('user'), icon_class: 'fa-solid fa-delete-left', menu_text: 'Delete account', type: 'button', method: :delete, class: 'mt-10' }
      ]
    )

    items
  end

  def seller_sidebar_links(items)
    items.push(
      path: tractor_listing_path(current_user.tractor_listing),
      icon_class: 'fa-solid fa-tractor',
      menu_text: 'Tractor Listings',
    )
  end

  def admin_sidebar_links(items)
    items.push(
      path: sellers_path,
      icon_class: 'fa-solid fa-shop',
      menu_text: 'Sellers',
    )
  end

  def bottom_nav_links
    items  =  [
      {
        menu_text: current_user.buyer? ? 'Home' : 'Dashboard',
        icon_class: 'fa-solid fa-house',
        path: root_path
      }
    ]

    if current_user.seller?
      items.push(
        path: tractor_listing_path(current_user.tractor_listing),
        icon_class: 'fa-solid fa-tractor',
        menu_text: 'Tractor Listings',
      )
    end

    items
  end
end
