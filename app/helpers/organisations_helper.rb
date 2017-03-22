module OrganisationsHelper
  def fetch_interviews(id)
    id = id.to_i
    case id
      when 1
        interviews = Interview.all
      when 2
        interviews = Interview.all
      when 3
        interviews = Interview.all
      when 4
        interviews = Interview.all
      when 5
        interviews = Interview.all
      else
        interviews = Interview.all
      end
  end
end
