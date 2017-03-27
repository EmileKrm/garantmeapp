module OrganisationsHelper
  def fetch_interviews(id)
    id = id.to_i
    case id
      when 1
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      when 2
        interviews = Interview.where({
          organisation_id: current_user.organisation.id,
          interview_completed: false,
          documents_submitted: false,
          documents_validated: false,
          agreement_signed: false,
          lease_provided: false,
          lease_signed: false
        })
      when 3
        interviews = Interview.where({
          organisation_id: current_user.organisation.id,
          interview_completed: true,
          documents_submitted: true,
          documents_validated: false,
          agreement_signed: false,
          lease_provided: false,
          lease_signed: false
        })
      when 4
        interviews = Interview.where({
          organisation_id: current_user.organisation.id,
          interview_completed: true,
          documents_submitted: true,
          documents_validated: true,
          agreement_signed: true,
          lease_provided: false,
          lease_signed: false
        })
      when 5
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      else
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      end
  end

  def active_feature?(instance, field)
    instance[field] ? "active-feature" : ""
  end

  def compute_student_stage(student)
    fields = [
      "professional_status",
      "city",
      "move_in_date",
      "monthly_budget",
      "monthly_income",
      "unique_signator",
      "organisation_id",
      "id_card",
      "proof_of_revenue",
      "school_certificate"
    ]
    score = 0
    fields.each do |field|
      interview = student.interviews.last
      p interview[field]
      score += 0.1 unless interview[field].nil?
    end
    return score
  end
end
