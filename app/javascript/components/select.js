import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

const initSelect = () => {
  $('#artist_tag_tag').select2(
    {
      tags: true
  });
};

export { initSelect };
