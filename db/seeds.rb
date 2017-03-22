
# !!!! Delete when doing a Heroku seed !!!

User.destroy_all
Organisation.destroy_all


###### ORG SEED ######

org = Organisation.new(name: "HEC Paris")

###### ADMIN SEED ######
email = 'admin@gmail.com'
admin = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: org.id, :is_manager => true, :admin => true)
admin.save!

###### MANAGER SEED ######
email = 'manager@gmail.com'
manager = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: org.id, :is_manager => true)
manager.save!

###### USER SEED ######
i = 0
7.times do
  ###### USER CREATION ######
  i += 1
  avatar_url = "https://maxcdn.icons8.com/Share/icon/Cinema//avatar1600.png"
  email_b = 'user' + i.to_s
  email = email_b +'@gmail.com'
  u = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: org.id)
  u.photo_url = avatar_url # Upload happens here
  u.save!
  ###### Interview CREATION ######
  url = "http://res.cloudinary.com/djm9dcvuc/image/upload/v1490103800/Garantme/2016_02.pdf"
  date = Faker::Date.forward(23)
  itw = Interview.new(organisation_id: org.id, user_id: u.id, move_in_date: date, city: Faker::Address.city, monthly_budget: 750, monthly_income: 1500)
  itw.id_card_url = url # Upload happens here
  itw.save!
end
