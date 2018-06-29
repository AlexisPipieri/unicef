function displayEcoleDetails(){
  const ecoleSelector = document.getElementById("input_ecole");
  ecoleSelector.addEventListener("change", function() {

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
        document.getElementById("nom").textContent = data.nom;
      })
  });
}

export { displayEcoleDetails }
