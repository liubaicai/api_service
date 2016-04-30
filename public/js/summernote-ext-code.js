(function (factory) {
  /* global define */
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module.
    define(['jquery'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // Node/CommonJS
    module.exports = factory(require('jquery'));
  } else {
    // Browser globals
    factory(window.jQuery);
  }
}(function ($) {

  // Extends plugins for adding hello.
  //  - plugin is external module for customizing.
  $.extend($.summernote.plugins, {
    /**
     * @param {Object} context - context object has status of editor.
     */
    'code': function (context) {
      var self = this;

      // ui has renders to build ui elements.
      //  - you can create a button with `ui.button`
      var ui = $.summernote.ui;

      // add hello button
      context.memo('button.code', function () {
        // create button
        var button = ui.button({
          contents: '<i class="fa fa-child"/> Code',
          tooltip: 'code',
          click: function () {
            // self.$panel.show();
            // invoke insertText method with 'hello' on editor module.
            var str=prompt("Code","");
            if(str)
            {
              $('#summernote').summernote('editor.pasteHTML', '<pre>'+str+'</pre>'); 
            }
          }
        });

        // create jQuery object from button instance.
        var $hello = button.render();
        return $hello;
      });

      // This events will be attached when editor is initialized.
      this.events = {
        // This will be called after modules are initialized.
        'summernote.init': function (we, e) {
          console.log('summernote initialized', we, e);
        },
        // This will be called when user releases a key on editable.
        'summernote.keyup': function (we, e) {
          console.log('summernote keyup', we, e);
        }
      };

      // This method will be called when editor is initialized by $('..').summernote();
      // You can create elements for plugin
      this.initialize = function () {
        this.$panel = $('<div class="panel panel-default"><div class="panel-body"><input type="text" id="code_title"></div></div>').css({
          position: 'absolute',
          width: 800,
          height: 600,
          left: '0%',
          top: '0%',
        }).hide();

        this.$panel.appendTo('body');
      };

      // This methods will be called when editor is destroyed by $('..').summernote('destroy');
      // You should remove elements on `initialize`.
      this.destroy = function () {
        this.$panel.remove();
        this.$panel = null;
      };
    }
  });
}));
