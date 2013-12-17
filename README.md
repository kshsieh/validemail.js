validemail.js
=============

jquery plugin to emulate gmail's validation of proper email formatting

what is it?
-----------

**validemail.js** visually acknowledges valid formatting of email in a text area similar to gmail's email input experience. it takes advantage of a content-editable div to apply and remove css classes and ids. using key bindings, it is able to append all valid emails to a hidden field for easy email submission using your form. it also supports copy pasting a list of emails, where pressing space or tab will collect all valid email strings and append them into the hidden field input for submission

the basics
----------

**validemail.js** requires some basic css and the javascript file.
default css class for **validemail.js** is currently *js-email-input-area*

make sure your form includes something like this:

```
<div class="js-email-input-area" content-editable="true">
  <input class="js-emails-field" id="form_emails" name="form[emails]" type="hidden" value>  
</div>
```

the important parts to note are that **validemail.js** operates off the two fields *js-email-input-area* and *js-emails-field*. other than that, it's just a basic form with a hidden field.

after that all you have to do is call:

``$('.js-email-input-area').validateEmail();``

and a simple email

![before](http://i.imgur.com/njrBSfZ.png)

with a press of [tab] or [space] becomes

![after](http://i.imgur.com/5pe4HAG.png)

and the input will have a value of all valid emails.

``<input class="js-emails-field" id="form_emails" name="form[emails]" type="hidden" value="foo@bar.baz ">``
