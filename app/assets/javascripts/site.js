$(document).on('turbolinks:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });

    $(".img-zoom").elevateZoom({
  		zoomType: "inner",
  		cursor: "crosshair"
});

    $("#alert").delay(4000).fadeOut(2000);
});

