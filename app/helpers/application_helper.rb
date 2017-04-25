module ApplicationHelper

  #时间格式处理
  def render_date_format(date)
    if date != nil
      #格式 %Y-%m-%d %H:%M:%S
      date.localtime.strftime("%Y-%m-%d")
    else
      ""
    end
  end

end
