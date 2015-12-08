$(document).ready(function() {
  var modalButton        = $("#modal-button");
  var modal              = $(".modal-container");
  var closeButton        = $('.close-button');
  var toggleModalHandler = function() {
    modal.toggle();
  };

  modalButton.on('click', toggleModalHandler);
  closeButton.on('click', toggleModalHandler);

});
  