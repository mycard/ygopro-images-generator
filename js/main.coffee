$(document).ready ->
  $('#card_form').submit ->
    @document.value = $('.card')[0].outerHTML

  $('.name').editable (value, settings) ->
    value

  $('.attribute').editable (value, settings) ->
    $(this).attr 'data-attribute', value
  , {
    placeholder: ""
    data: JSON.stringify {'water': '水', 'fire': '炎'}
    type: 'select'
    submit: 'OK'
    }


  $('.monster_type').editable (value, settings) ->
    value
  $('.number').editable (value, settings) ->
    value
  $('.edition').editable (value, settings) ->
    value
  $('.rule_text').editable (value, settings) ->
    value
  , {
    type: 'textarea',
    submit: 'OK'
  }
  $('.name').editable (value, settings) ->
    value
  $('.gamecode').editable (value, settings) ->
    value
  $('.atk').editable (value, settings) ->
    value
  $('.def').editable (value, settings) ->
    value
