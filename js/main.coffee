$(document).ready ->
  $.i18n.properties
    name: 'card'
    path: 'locales/'
    mode: 'both'
    callback: ->

      #example data
      $('#card').html $('#card_template').tmpl
                        name: '上海人形'
                        attribute: 'light'
                        level: 4
                        card_type: 'normal'
                        category: 'monster'
                        type: 'spellcaster'
                        image_url: 'data:image/jpeg;base64,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'
                        description: '这张卡被战斗破坏时，场上一只怪物的攻击力下降500。这张卡从场上送去墓地后，再我方场上表侧守备表示特殊召唤1只「人偶衍生物」(机械族 暗 1星 攻/守200 不能作为上级召唤的解放对象)。'
                        id: 99999998
                        atk: 1750
                        def: 1000

      #submit
      $('#card_form').submit ->
        $('.editable').each (_, element) ->
          element.contentEditable = 'false'
          $(element).removeAttr 'contentEditable'
          $(element).removeClass 'editable'
        @document.value = $('.card')[0].outerHTML

      #editable
      $('.attribute').editable (value, settings) ->
        $(this).attr 'data-attribute', value
      , {
        placeholder: ""
        data: JSON.stringify {'dark': '暗', 'divine': '神', 'earth': '地', 'fire': '炎', 'light': '光', 'water': '水', 'wind': '风'}
        type: 'select'
        submit: 'OK'
        }


      $('.editable').each (_, element) ->
        if element.classList.contains('attribute')
          # TODO(lynn): Improve Attribute editing.
        else if element.classList.contains('level')
          $(element).click (e) ->
            delta = 0
            if e.offsetX < 0
              delta = 1
            else if e.offsetX > element.getClientRects()[0].width
              delta = -1

            old_level = parseInt(element.dataset['level'])
            new_level = old_level + delta
            if new_level != old_level && new_level > 0 && new_level <= 12
              element.dataset['level'] = new_level
            false
              
          # Level
        else
          element.contentEditable = "plaintext-only"
          if element.contentEditable != "plaintext-only"
            element.contentEditable = "true"

        #$('.rule_text').editable (value, settings) ->
        #value
        #, {
        #type: 'textarea',
        #submit: 'OK'
        #}

      #batch
      $('#all_button').click ->

        mycard.fetch_cards (cards) ->

          #windows
          #result = "@echo off\n"
          #escape_batch_characters =
          #  '%': '%%'
          #  '^':	'^^'
          #  '&':	'^&'
          #  '<':	'\^<'
          #  '>':	'^>'
          #  '|':	'^|'
          #
          #for card in cards
          #  result += "echo #{$('#card_template').tmpl(card)[0].outerHTML.replace(/[^\x00-\x7F]|[\%\^\&\<\>\|]/g, (key)->(escape_batch_characters[key] or"^&##{key.charCodeAt(0)};"))} > temp.html\n"

          result = "mkdir result\n"
          i = 1
          for card in cards
            result += "echo '(#{i}/#{cards.length}: #{card.name}[#{card.id}])'\n"
            result += "cat <<-END_CARD > temp.html\n#{$('#card_template').tmpl(card)[0].outerHTML}\nEND_CARD\n"
            result += "wkhtmltoimage --encoding 'UTF-8' --width '421' --height '614' --user-style-sheet 'mycard-images/style.css' 'temp.html' 'result/#{card.id}.png' 2>/dev/null\n"
            i++

          $('#all_script').val result
