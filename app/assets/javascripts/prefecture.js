$(document).on('turbolinks:load', function() {

  // selectを追加するHTML
  var cat_seach = $("#cat");

  function appendSelect(catNum) {
    if(catNum == 1) {
      var select_id = `m_prefecture`
    } else if(catNum == 2) {
      var select_id = `s_prefecture`
    }
    var html =
    `<select name="teacher[prefecture]" id="${select_id}">
        <option value>---</option>
    </select>`
    cat_seach.append(html)
  }


  // optionを追加するHTML
  function appendCat(catOption, catNum) {
    if (catNum == 1) {
      var appendId = $("#m_prefecture")
    } else if (catNum == 2) {
      var appendId = $("#s_prefecture")
    }
    appendId.append(
      $("<option>")
        .val($(catOption).attr('id'))
        .text($(catOption).attr('name'))
    )
  }

  // Lカテゴリーが選択された時のアクション
  $("#l_prefecture").on('change', function() {
    l_cat = $(this).val()
    $("#m_prefecture, #s_prefecture").remove()

    // ajaxでリクエストを送信
      $.ajax({
        type: "GET",
        url: "/teachers/profiles/search",
        data: {l_cat: l_cat},
        dataType: 'json'
      })
      // doneメソッドでappendする
      .done(function(m_cat) {
        var catNum = 1
        appendSelect(catNum)
        m_cat.forEach(function(m_cat) {
          appendCat(m_cat, catNum)
        })
      })
    })

// Mカテゴリーが選択された時のアクション
  $(document).on('change', "#m_prefecture", function() {
    m_cat = $(this).val()
    $("#s_prefecture").remove()

    $.ajax({
      type: "GET",
      url: "/teachers/profiles/search",
      data: {m_cat: m_cat},
      dataType: 'json'
    })
    .done(function(s_cat) {
      var catNum = 2
      appendSelect(catNum)
      s_cat.forEach(function(s_cat) {
        appendCat(s_cat, catNum)
      })
    })
  })
})
