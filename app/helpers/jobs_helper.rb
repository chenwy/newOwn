module JobsHelper

  #以图标方式展示工作的状态
  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", class: "fa fa-lock")
    else
      content_tag(:span, "", class: "fa fa-globe")
    end
  end
end
