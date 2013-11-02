$(function() {
  $( '#sortable' ).sortable({
    placeholder: 'ui-state-highlight'
  });
  $( '#sortable' ).disableSelection();
}); 

// return order of a sortable list
var returnOrderBinding = new Shiny.InputBinding();
$.extend(returnOrderBinding, {
  find: function(scope) {
    return $(scope).find('#sortable');
  },
  getId: function(el) {
    return Shiny.InputBinding.prototype.getId.call(this, el) || el.name;
  },
  getValue: function(el) {
		// ZJ's suggestion from https://groups.google.com/forum/?fromgroups=#!topic/shiny-discuss/f3n5Iv2wNQ8
		$("ul li").map(function(i,el) {return $(el).text()})
    // return el.value;
  },
  setValue: function(el, value) {
    el.value = value;
  },
  subscribe: function(el, callback) {
    $(el).on("keyup.returnOrderBinding", function(event) {
      callback(true);
    });
    $(el).on("change.returnOrderBinding", function(event) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off('.returnOrderBinding');
  },
  receiveMessage: function(el, data) {
    if (data.hasOwnProperty('value'))
      this.setValue(el, data.value);

    $(el).trigger('change');
  },
  getState: function(el) {
    return {
      value: el.value
    };
  },
});
Shiny.inputBindings.register(returnOrderBinding, 'returnOrder');

