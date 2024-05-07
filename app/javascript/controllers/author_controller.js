// app/javascript/controllers/author_controller.js
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['fields'];

  addAuthor(event) {
    event.preventDefault();
    let content = this.fieldsTarget.querySelector('.author-template').innerHTML;
    this.fieldsTarget.insertAdjacentHTML(
      'beforeend',
      content.replace(/NEW_RECORD/g, new Date().getTime()),
    );

    // Get all selected author IDs
    const selectedAuthorIds = Array.from(
      document.querySelectorAll('select[name$="[author_id]"]'),
    ).map((select) => select.value);

    // Filter author selects
    const authorSelects = document.querySelectorAll(
      'select[name$="[author_id]"]',
    );
    authorSelects.forEach((select) => {
      const options = Array.from(select.options);
      options.forEach((option) => {
        if (selectedAuthorIds.includes(option.value)) {
          option.hidden = true;
        } else {
          option.hidden = false;
        }
      });
    });
  }

  removeAuthor(event) {
    event.preventDefault();
    let wrapper = event.target.closest('.author-fields');
    if (wrapper.dataset.newRecord == 'true') {
      wrapper.remove();
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1;
      wrapper.style.display = 'none';
    }
  }
}
