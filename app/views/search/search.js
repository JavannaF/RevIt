
$("#new_foobar").change(function() { 
  $form = $(this);
  $input_value = $form.children("#avg_price").val();
  $label = $form.children("#avg_price").siblings("label");
  $label.text("Current Value = " + $input_value);
})
