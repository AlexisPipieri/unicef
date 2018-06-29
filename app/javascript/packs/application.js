import "bootstrap";
import "../plugins/flatpickr"
import '../components/select2';

import { displayEcoleDetails } from '../components/intervention_form_new';
if (document.getElementById("add_intervention_form")) {
  displayEcoleDetails();
};
