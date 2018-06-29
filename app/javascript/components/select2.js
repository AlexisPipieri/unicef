import $ from 'jquery';
import 'select2';

$('.select2plaideurs').select2({
  maximumSelectionLength: 2,
  placeholder: '',
  tags: false,
  allowClear: true
});

import 'select2/dist/css/select2.css';
