module UsersHelper
  #use method everytime you want to add a user picture
  # simply write the following in your show
  # <%= user_picture_avatar(the user you want to display, "the class you want to give the picture" %>
  # example: <%= user_picture_avatar(current.user, "avatar-large")
  def user_picture_avatar(user, image_class)
   if user.photo?
    cl_image_tag(user.photo.path, { class: image_class})
   else
    avatar_url = user.linkedin_picture_url || "http://placehold.it/100x100"
    image_tag avatar_url, class: image_class
   end
  end
end
