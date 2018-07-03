json.id @ecole.id
json.nom @ecole&.nom ? @ecole.nom : "Information non disponible"
json.code @ecole&.code ? @ecole.code : "Information non disponible"
json.adresse @ecole&.adresse ? @ecole.adresse : "Information non disponible"
json.email @ecole&.email ? @ecole.email : "Information non disponible"
json.tel @ecole&.telephone ? @ecole.telephone : "Information non disponible"
json.responsable @ecole&.responsable ? @ecole.responsable : "Information non disponible"
json.enseignants @ecole&.enseignants ? @ecole.enseignants : "Information non disponible"
json.type @ecole&.type ? @ecole.type : "Information non disponible"
