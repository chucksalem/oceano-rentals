$(document).ready(function(){
  $('.js-show-reviews').on('click',function(el){
    var url = $(el.target).data('url');
    var root = $('.reviews-container');
    var source   = document.getElementById("reviews-template").innerHTML;
    el.preventDefault();
    $.ajax({
      url: url,
      method: 'GET',
      success: function (data) {
        var template = Handlebars.compile(source);
        root.empty();
        $.each(data, function(index, item) {
          var content = template(item);
          root.append(content);
        });
      }
    });
  })
});