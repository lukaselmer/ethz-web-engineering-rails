$ ->
  add_image = (res, first) ->
    container = $('#selectActivityImage .search-results')

    img_container = $('<div></div>')
    img_container.addClass('img-container')
    img_container.addClass('active') if first

    img = $('<img/>')
    img.data('link', res.link)
    img.attr('src', res.url)

    img_container.append(img)
    container.append(img_container)

  $('#selectActivityImage .search-form .btn').on 'click', (e) ->
    e.preventDefault();
    search_str = $('#selectActivityImage .search-form input').val()

    $('#selectActivityImage .search-results').empty()

    $.ajax
      url: "/search_images/" + search_str
      dataType: "json"
      success: (data) ->
        $('#selectActivityImage .search-results').empty()
        first = true
        for d in data
          add_image(d, first)
          first = false

  $('#selectActivityImage .search-box .next').on 'click', (e) ->
    e.preventDefault()
    old = $('#selectActivityImage .img-container.active')
    n = old.next()
    if n.length == 0
      n = $(old.parent().children()[0])
    old.removeClass('active')
    n.addClass('active')

  $('#selectActivityImage .search-box .prev').on 'click', (e) ->
    e.preventDefault()
    old = $('#selectActivityImage .img-container.active')
    n = old.prev()
    if n.length == 0
      n = $(old.parent().children()[old.parent().children().length - 1])
    old.removeClass('active')
    n.addClass('active')

  $('#selectActivityImage .save-activity-image').on 'click', (e) ->
    e.preventDefault()

    new_image = $('#selectActivityImage .img-container.active img').attr('src')
    $('.activity-image').attr('src', new_image)

    new_link = $('#selectActivityImage .img-container.active img').data('link')
    $('.activity-image-link').attr('href', new_link).text(new_link)

    $.ajax
      type: "PUT"
      url: "/activities/" + $(this).data('activity')
      dataType: "json"
      data:
        activity:
          image_url: new_image
          image_link: new_link

      success: () ->
        $('#selectActivityImage').modal('hide')
