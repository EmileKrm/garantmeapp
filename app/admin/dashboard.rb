ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Users" do
          ul do
            User.all.map do |user|
              li link_to("#{user.first_name} #{user.last_name}", admin_user_path(user))
            end
          end
        end
      end
      column do
        panel "Organisations" do
          ul do
            Organisation.all.map do |organisation|
              li link_to("#{organisation.name}", admin_organisation_path(organisation))
            end
          end
        end
      end
    end
  end
end


