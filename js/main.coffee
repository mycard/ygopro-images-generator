$(document).ready ->
  $('.name').editable (value, settings) ->
    value

  $('.attribute').editable (value, settings) ->
    $(this).attr 'data-attribute', value
  , {
      placeholder:""
      data: JSON.stringify {'water': '水', 'fire': '炎'}
      type: 'select'
      submit : 'OK'
    }

