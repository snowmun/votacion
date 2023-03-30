function getComunas() {
  var regionId = $('#region').val();
  $.getJSON('../controller/comunaController.php', {regionId: regionId}, function(data) {
      var options = '';
      $.each(data, function(index, value) {
          options += '<option value="' + value.id + '">' + value.nombre + '</option>';
      });
      $('#comuna').html(options);
  });
}
