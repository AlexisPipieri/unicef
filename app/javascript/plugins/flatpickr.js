import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import { French } from "flatpickr/dist/l10n/fr.js";

flatpickr(".datepicker", {
  altInput: true,
  allowInput: true,
  enableTime: true,
  time_24hr: true,
  timeFormat: "H:i",
  locale: French,
  altFormat: "l d F Y, H:i"
})
