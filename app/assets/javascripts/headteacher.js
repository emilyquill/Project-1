$(document).ready(function() {

  $('.pagination a').on('click', function () {
    for (var i = 0; i < requests.length; i++) {
      console.log('aborting', requests[i]);
      requests[i].abort();
    }
  });

  var requests = [];
  $('.organization-id').each(function () {
    var $this = $(this);
    var id = $this.val();
    var request = $.ajax({
      url: "/organizations/" + id + "/headteacher",
      data: {
         format: 'json'
      },
      dataType: 'json',
      error: function() {
         $this.parent().html('<p>Not Found</p>');
      },
      success: function(data) {
        if (data.name === null) {
          $this.parent().text("Not found");
        } else {
         $this.parent().text(data.name);
       }
      }
    });

    requests.push(request);
  });

});
