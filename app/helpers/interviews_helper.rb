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
      "completed-s"
    else
      "reached-s"
    end
  end

  def second_step(interview)
    if interview.agreement_signed == true
      "completed-s"
    elsif interview.interview_completed == true
      "reached-s"
    else
      " "
    end
  end

  def third_step(interview)
    if interview.agreement_signed == true
      "completed-s"
    else
      " "
    end
  end

  def answer_logic(user, interview, question)

      # first if handles model selection interview vs user
      if question['model'] == 'interview'

        if @interview.send(question['field']) == true
          "yes"
        # manages attachment options
        elsif question['question_type'] == "attachment"
          if @interview.send(question['field']).nil?
            "Not yet submitted"
          else
            "Uploaded"
          end

        elsif @interview.send(question['field']).nil?
          "Completed"

        elsif @interview.send(question['field']) == false
          "no"

        else
          @interview.send(question['field'])
        end
      # end of second if

      else
        if @user.send(question['field']) == true
          "yes"
        elsif @user.send(question['field']).nil?
          "Please complete your details"
        elsif @user.send(question['field'])== false
          "no"
        else
          @user.send(question['field'])
        end
      end

  end

end
