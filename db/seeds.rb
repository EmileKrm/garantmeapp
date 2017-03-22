
# !!!! Delete when doing a Heroku seed !!!

User.destroy_all


###### MANAGER SEED ######
email = 'manager@gmail.com'
manager = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: 1, :is_manager => true)
manager.save!
###### USER SEED ######
i = 0
7.times do
  ###### USER CREATION ######
  i += 1
  avatar_url = "https://maxcdn.icons8.com/Share/icon/Cinema//avatar1600.png"
  email_b = 'user' + i.to_s
  email = email_b +'@gmail.com'
  u = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: 1)
  u.photo_url = avatar_url # Upload happens here
  u.save!
  ###### Interview CREATION ######
  url = "http://res.cloudinary.com/djm9dcvuc/image/upload/v1490103800/Garantme/2016_02.pdf"
  date = Faker::Date.forward(23)
  itw = Interview.new(organisation_id: 1, user_id: u.id, move_in_date: date, city: Faker::Address.city, monthly_budget: 750, monthly_income: 1500)
  itw.id_card_url = url # Upload happens here
  itw.save!
end

###### Interviews (ITW) SEED ######

# i = 0
# 10.times do
#   # has_attachement :id_card
#   # id_card_url = cl_image_path("Garantme/id")
#   user = User.all[i]
#   i += 1
# end



###### ORG SEED ######

# org = Organisation.find(1)

# Interview.all.each do |elt|
#   elt.organisation = org
#   elt.save!
# end
