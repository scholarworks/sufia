export default class {
  constructor(elem) {
    let Participants = require('sufia/admin/admin_set/participants');
    let participants = new Participants(elem.find('#participants'))
    participants.setup();
<<<<<<< adminset_workflows

    let Visibility = require('sufia/admin/admin_set/visibility');
    let visibilityTab = new Visibility(elem.find('#visibility'));
    visibilityTab.setup();
=======
>>>>>>> Search for a user on the AdminSet participants form
  }
}
