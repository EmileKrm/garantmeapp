
# !!!! Delete when doing a Heroku seed !!!

User.destroy_all


###### MANAGER SEED ######
email = 'manager@gmail.com'
u = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: 1, :is_manager => true)
u.save!
manager = User.new()
###### USER SEED ######
i = 0
10.times do
  i += 1
  url = "https://maxcdn.icons8.com/Share/icon/Cinema//avatar1600.png"
  email_b = 'user+' + i.to_s
  email = email_b +'@gmail.com'
  u = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: 1)
  u.photo_url = url # Upload happens here
  u.save!
end

###### Interviews (ITW) SEED ######

i = 2
7.times do
  # has_attachement :id_card
  # id_card_url = cl_image_path("Garantme/id")
  url = "http://res.cloudinary.com/djm9dcvuc/image/upload/v1490103800/Garantme/2016_02.pdf"
  user = User.all[i]
  date = Faker::Date.forward(23)
  i += 1
  itw = Interview.new(organisation_id: 1, user_id: user.id, move_in_date: date, city: Faker::Address.city, monthly_budget: 750, monthly_income: 1500)
  itw.id_card_url = url # Upload happens here
  itw.save!
end



###### ORG SEED ######

# org = Organisation.find(1)

# Interview.all.each do |elt|
#   elt.organisation = org
#   elt.save!
# end
