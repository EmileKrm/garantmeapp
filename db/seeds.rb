
# !!!! Delete when doing a Heroku seed !!!
#### SEED HELPERS ###
def true_false
  if rand(0...1) == 0
    true
  else
    false
  end
end

# User.destroy_all
# Organisation.destroy_all

###### HEC SEED ######

org = Organisation.new(id: 1, name: "HEC Paris")
org.save!

###### ORG SEED ######

# file = File.read(File.join(Rails.root, 'db', 'universities.json'))
# data_hash = JSON.parse(file)
# data_hash.each do |elt|
#   if elt["alpha_two_code"] == "FR"
#     p elt
#     org = Organisation.new(name: elt["name"])
#     org.save!
#   end
# end

###### ADMIN SEED ######

email = 'admin@gmail.com'
admin = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: org.id, :is_manager => true, :admin => true)
admin.save!

###### MANAGER SEED ######

email = 'manager@gmail.com'
manager = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: 1, :is_manager => true)
manager.save!

# ###### USER SEED ######
# i = 0
# 7.times do
#   ###### USER CREATION ######
#   i += 1
#   avatar_url = "https://maxcdn.icons8.com/Share/icon/Cinema//avatar1600.png"
#   email_b = 'user' + i.to_s
#   email = email_b +'@gmail.com'
#   u = User.new(email: email, password: '123456', first_name: Faker::Internet.user_name, last_name: Faker::Internet.user_name, organisation_id: 1)
#   u.photo_url = avatar_url # Upload happens here
#   u.save!
#   ###### Interview CREATION ######
#   url = "http://res.cloudinary.com/djm9dcvuc/image/upload/v1490103800/Garantme/2016_02.pdf"
#   date = Faker::Date.forward(23)
#   itw = Interview.new(organisation_id: 1, user_id: u.id, move_in_date: date, city: Faker::Address.city, monthly_budget: rand(200..1000), monthly_income: rand(800..5000), has_found_apartment: true_false(), has_a_cosigner: true_false(), arrondissement: rand(1..20))
#   itw.id_card_url = url # Upload happens here
#   itw.save!
# end

