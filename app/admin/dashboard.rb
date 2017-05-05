ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Users" do
          ul do
            last_users = User.last(30).reverse
            last_users.map do |user|
              if user.first_name == ""
                li link_to("#{user.email}", admin_user_path(user))
              else
                li link_to("#{user.first_name} #{user.last_name}", admin_user_path(user))
              end
            end
          end
        end
      end
      column do
        panel "Organisations" do
          ul do
            last_organisations = Organisation.last(30).reverse
            last_organisations.map do |organisation|
              li link_to("#{organisation.name}", admin_organisation_path(organisation))
            end
          end
        end
      end
      #Leads code
      column do
        panel "Leads" do
          ul do
            last_organisations = Lead.last(30).reverse
            last_organisations.map do |lead|
              li link_to("#{lead.lead_first_name} #{lead.lead_email}", admin_lead_path(lead))
            end
          end
        end
      end
      #Leads end
    end
  end
end


