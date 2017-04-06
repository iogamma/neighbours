class ImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 16/9
      setSelect: [0, 0, 325, 122]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#event_crop_x').val(coords.x)
    $('#event_crop_y').val(coords.y)
    $('#event_crop_w').val(coords.w)
    $('#event_crop_h').val(coords.h)

execute = ->
  if  $('.events.create').length > 0
    new ImageCropper()

$(document).ready(execute)