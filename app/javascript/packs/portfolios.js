var setPositions = function(){
  $('.card').each(function(index){
    $(this).attr('data-pos', index + 1);
  });
}

$(document).ready(function(){
  setPositions();
  $('.sortable').sortable();
  $('.sortable').sortable().bind('sortupdate', function(e, ui){
    var updatedOrder = [];
    setPositions();
    $('.card').each(function(index){
      updatedOrder.push({
        id: $(this).data('id'),
        position: index + 1
      });
    });
    $.ajax({
      type: 'PUT',
      url: '/portfolios/sort',
      data: {order: updatedOrder}
    });
  });
});