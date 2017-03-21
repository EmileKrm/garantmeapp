##### ITW SEED

i = 2
7.times do
  user = User.all[i]
  date = Faker::Date.forward(23)
  i += 1
  itw = Interview.new(organisation_id: 1, user_id: user.id, move_in_date: date, city: Faker::Address.city, monthly_budget: 750, monthly_income: 1500)
  itw.save!
end


######################## USER SEED

# 10.times do
#   i += 1
#   email_b = 'quentin.gondat+' + i.to_s
#   email = email_b +'@gmail.com'
#   u = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: 1)
#   u.save!
# end

######################## ORG SEED

# org = Organisation.find(1)

# Interview.all.each do |elt|
#   elt.organisation = org
#   elt.save!
# end
