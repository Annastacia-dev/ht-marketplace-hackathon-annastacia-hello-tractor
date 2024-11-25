module TractorsHelper

  def publishing_status_badge_class(status)
    case status
    when 'draft'
      'bg-gray-300 text-white'
    when 'ready_for_approval'
      'bg-amber-300'
    when 'approved'
      'bg-green-500'
    end
  end
end
