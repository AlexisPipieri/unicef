function displayEcoleInfo() {
  const videoForm = document.getElementById("add_intervention_form");
  const inputEcole = document.getElementById("input_ecole");

  inputEcole.addEventListener('change', (event) => {
    console.log(inputEcole.value);
  });
}

export{displayEcoleInfo};
