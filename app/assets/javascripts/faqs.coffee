jQuery ->
  $('#faqs').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))