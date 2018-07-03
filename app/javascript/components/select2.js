import $ from 'jquery';
import 'select2';

$('.select2ecoles').select2({
  placeholder: 'Rechercher une école',
  tags: false,
  allowClear: true
});

$('.select2themes').select2({
  placeholder: 'Rechercher un thème',
  tags: false,
  allowClear: true
});

$('.select2plaideurs').select2({
  maximumSelectionLength: 2,
  placeholder: 'Rechercher un plaideur',
  tags: false,
  allowClear: true
});

import 'select2/dist/css/select2.css';
