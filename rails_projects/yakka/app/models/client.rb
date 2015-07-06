#     PROPERTIES

#     t.string "cli_nom",          limit: 25, null: false
#     t.string "cli_prenom",       limit: 20, null: false
#     t.string "cli_adresse",      limit: 50, null: false
#     t.string "cli_cp",           limit: 10, null: false
#     t.string "cli_localite",     limit: 50, null: false
#     t.string "cli_fk_pays",      limit: 2,  null: false
#     t.string "cli_telephone",    limit: 20, null: false
#     t.string "cli_numero_carte", limit: 20, null: false
#     t.string "cli_mot_passe",    limit: 50, null: false
#     t.string "cli_email",        limit: 40, null: false

class Client < ActiveRecord::Base
  belongs_to :country
  
end