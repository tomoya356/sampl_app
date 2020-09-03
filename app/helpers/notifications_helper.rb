module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    case notification.action
    when "follow"
      tag.a(notification.visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"
    end  
  end
end
