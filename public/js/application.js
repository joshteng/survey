$(document).ready(function() {

  // $('form').on('click', '#submit_survey', function(e) {
  //   e.preventDefault();
  //   data = $(this);
  //   debugger
  //   console.log(data);
  //   $.ajax({
  //     url: '/surveys/',
  //     type: 'post',
  //     data: data
  //   }).done(function() {
  //     window.location.href('/surveys')
  //   })
  // })
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

});
