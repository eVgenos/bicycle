$(document).on 'turbolinks:load', ->
  $('.bicycles').DataTable
    processing: true
    serverSide: true
    ajax: $('.bicycles').data('source')
    pagingType: 'full_numbers'
    columns: [
      { data: 'name' }
      { data: 'description' }
      { data: 'category' }
      { data: 'created_at' }
      { data: 'suggestions' }
    ]
  return