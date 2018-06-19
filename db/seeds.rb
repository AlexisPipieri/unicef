require 'yaml'

puts 'Destroying interventions...'
Intervention.destroy_all
puts 'Destroying ecoles...'
Ecole.destroy_all
puts 'Destroying professeurs...'
Professeur.destroy_all
puts 'Destroying themes...'
Theme.destroy_all
puts 'Destroying PlaideurInterventions...'
PlaideurIntervention.destroy_all
puts 'Destroying users...'
User.destroy_all

file = Rails.root.join('db', 'seeds', 'seed.yml')
sample = YAML.load(open(file).read)

puts 'Creation écoles...'
ecoles = {}
sample["ecoles"].each do |ecole|
  ecoles[ecole["nom"]] = Ecole.create! ecole.slice("nom", "adresse", "responsable", "email")
end

puts 'Creation thèmes...'
themes = {}
sample["themes"].each do |theme|
  themes[theme["nom"]] = Theme.create! theme.slice("nom")
end

puts 'Creation users...'
users = {}
sample["users"].each do |user|
  users[user["nom"]] = User.create! user.slice("prenom", "nom", "tel", "email", "password", "niveau", "admin")
end


puts 'Creating interventions...'
interventions = {}
sample["interventions"].each do |intervention|
  theme = themes[intervention["theme"]]
  ecole = ecoles[intervention["ecole"]]
  interventions[intervention] = Intervention.create! intervention.slice("date_contact",
    "date_intervention", "statut", "theme", "ecole").merge(theme: theme).merge(ecole: ecole)
end

puts 'Finished!'

