// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require highlight.pack
//= require rails
//= require summernote
//= require summernote-ext-code

$(document).ready(function() {
    $('pre').each(function(i, block) {
        hljs.highlightBlock(block);
    });
    $('#summernote').summernote({
        height: "300px",
        callbacks: {
            onImageUpload: function(files) {
                var $editor = $(this);
                var data = new FormData();
                data.append('fileup', files[0]);
                $.ajax({
                    url: '/image/upload',
                    method: 'POST',
                    data: data,
                    processData: false,
                    contentType: false,
                    success: function(url) {
                        $editor.summernote('insertImage', url);
                    }
                });
            }
        }
    });
});