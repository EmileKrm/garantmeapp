module InterviewsHelper
  def progress_bar_percent(interview)
    if interview.interview_completed == true
      "50%"
    elsif interview.agreement_signed == true
      "100%"
    else
      "0"
    end
  end

  def first_step(interview)
    if interview.interview_completed == true
      "completed"
    else
      "reached"
    end
  end

  def second_step(interview)
    if interview.agreement_signed == true
      "completed"
    elsif interview.interview_completed == true
      "reached"
    else
      " "
    end
  end

   def third_step(interview)
    if interview.agreement_signed == true
      "completed"
    else
      " "
    end
  end
end
