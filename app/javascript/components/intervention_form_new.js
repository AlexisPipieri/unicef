function displayEcoleDetails(){
  // The following code works if the input doesnt use select2
  // const ecoleSelector = document.getElementById("input_ecole");
  // ecoleSelector.addEventListener("change", function() {

  // jQuery notation to be compliant with Select2 events
  $('#input_ecole').on('select2:select', function() {

    function handleErrors(response) {
      if (!response.ok) {
        document.getElementById("nom").textContent = "Information non disponible";
        throw Error(response.statusText);
      }
      return response;
    }
    fetch('/api/v1/ecoles/' + this.value.toString())
      .then(handleErrors)
      .then(response => response.json())
      .then(data => {
        document.getElementById("nom_ecole_value").textContent = data.nom;
        document.getElementById("code_ecole_value").textContent = data.code;
        document.getElementById("type_ecole_value").textContent = data.type;
        document.getElementById("adresse_ecole_value").textContent = data.adresse;
        document.getElementById("tel_ecole_value").textContent = data.tel;
        document.getElementById("email_ecole_value").textContent = data.email;
        document.getElementById("responsable_ecole_value").textContent = data.responsable;
        document.getElementById("enseignants_ecole_value").textContent = data.enseignants.join(", ");
      })
  });
}

export { displayEcoleDetails }
