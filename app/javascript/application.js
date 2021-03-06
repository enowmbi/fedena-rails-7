// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

document.observe("dom:loaded", function() {
    $$('object').each(function(obj) {
        a = document.createElement('param');
        a.name = 'wmode';
        a.value = 'transparent';
        obj.appendChild(a);
    });

    load_menu_from_plugins();
});