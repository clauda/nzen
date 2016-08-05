# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

SPMaskBehavior = (val)->
  if (val.replace(/\D/g, '').length == 11) then '(00) 00000-0000' else '(00) 0000-00009'

spOptions =
  onKeyPress: (val, e, field, options)->
    field.mask(SPMaskBehavior.apply({}, arguments), options)

$('#service_phone').mask(SPMaskBehavior, spOptions);
($("#service_zipcode")).mask("99999-999");

selectDistrict = (value)->
  dd = document.getElementById('service_district_id')
  i = 0
  while i < dd.options.length
    if (dd.options[i].text == value)
      dd.selectedIndex = i
      break
    i++

data = new Bloodhound(
  limit: 10
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
  queryTokenizer: Bloodhound.tokenizers.whitespace
  prefetch: '/remote/categories.json'
)
data.initialize(true)

$('#categories .typeahead').typeahead(null,
  name: 'name'
  display: 'name'
  source: data
)

$('.typeahead').bind 'typeahead:select', (e, got)->
  $('#service_category_id').val(got.id)

$('#service_zipcode').on 'keyup', ->
  zipcode = $(@).val()
  if (zipcode.length > 7)
    $.get("http://apps.widenet.com.br/busca-cep/api/cep.json?code=#{zipcode}", (data)->
      if (data.status == 1)
        $('#service_address').val(data.address)
        selectDistrict(data.district)
    )

