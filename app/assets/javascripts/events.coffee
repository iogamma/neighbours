ready = ->
  
  if  $(".crop-image").length > 0
    new ImageCropper()

  class ImageCropper
    constructor: ->
      $('#cropbox').Jcrop
        aspectRatio: 16/9
        setSelect: [0, 0, 1138, 428]
        onSelect: @update
        onChange: @update
    
    update: (coords) =>
      $('#event_crop_x').val(coords.x)
      $('#event_crop_y').val(coords.y)
      $('#event_crop_w').val(coords.w)
      $('#event_crop_h').val(coords.h)

$(document).on('turbolinks:load', ready)