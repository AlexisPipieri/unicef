require 'yaml'

puts 'Destroying ecoles...'
Ecole.destroy_all
puts 'Destroying professeurs...'
Professeur.destroy_all
puts 'Destroying interventions...'
Intervention.destroy_all
puts 'Destroying themes...'
Theme.destroy_all
puts 'Destroying PlaideurInterventions...'
PlaideurIntervention.destroy_all
puts 'Destroying users...'
User.destroy_all
