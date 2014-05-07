module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def remaining_days
    if days_count > 0
      days_count
    else
      0
    end
  end

  def trial_expired?
    if remaining_days <= 0
     redirect_to trial_expired_path
    end
  end

  def days_count
    (current_user.created_at.to_date + 20.days) - Date.today
  end


end
