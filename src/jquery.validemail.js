jQuery(function() {
  return $.fn.validEmail = function() {
    var validateEmail,
      _this = this;
    validateEmail = function() {
      var i, input, matched, replaceContent;
      input = $(_this).text();
      replaceContent = "";
      matched = input.match(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/gi);
      i = 0;
      if (matched) {
        while (i < matched.length) {
          replaceContent += "<span class='valid-email' contenteditable='false'>" + matched[i] + "</span>&nbsp;";
          i++;
        }
        $(_this).html(' ');
        return $(_this).prepend(replaceContent);
      }
    };
    validateEmail();
    $(this).keypress(function(e) {
      return e.which !== 13;
    });
    $(this).keydown(function(event) {
      if (event.keyCode === 9 || event.keyCode === 32) {
        return validateEmail();
      }
    });
    return $(this).focusout(function() {
      var emailsToSend;
      emailsToSend = "";
      $('.valid-email').each(function() {
        return emailsToSend += $(this).text() + " ";
      });
      return $('.js-emails-field').val(emailsToSend);
    });
  };
});
