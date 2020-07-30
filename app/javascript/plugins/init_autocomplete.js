import places from 'places.js';

const initAutocomplete = (id) => {
  const input = document.getElementById(id);
  if (input) {
    places({ container: input });
  }
};

export { initAutocomplete };