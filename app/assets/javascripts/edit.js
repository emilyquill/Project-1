$(document).ready(function() {
     $('.type').editable(window.location.href, {
       id   : 'establishment_type',
       name : 'value',
       submitdata : { _method: "put" }

     });
 });
