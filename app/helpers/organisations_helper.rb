module OrganisationsHelper
  def fetch_interviews(id)
    id = id.to_i
    case id
      when 1
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      when 2
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      when 3
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      when 4
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      when 5
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      else
        interviews = Interview.where({ organisation_id: current_user.organisation.id })
      end
  end

  def active_feature?(instance, field)
    instance[field] ? "active-feature" : ""
  end
end
