$(document).ready(function() {

  var question = $('.question').clone();
  var choice = $('.choice').clone();

  $('form').on('click', 'button[name=add_choice]', function(e) {
    e.preventDefault();
    $(this).closest('.choice').after(choice.clone());
    $(this).remove();
  })

  $('form').on('click', 'button[name=add_question]', function(e) {
    e.preventDefault();
    $(this).closest('.question').after(question.clone());
    $(this).remove();
  })  

  // $(document).on('click', function() {
  //   $('.login-group').append('.header')
  // })
});
