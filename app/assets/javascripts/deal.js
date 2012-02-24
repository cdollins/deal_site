$.periodic({period: 2000, decay: 1.2, max_period: 60000}, function() {
	 $.getJSON(aaDealPath, function(data) {
	  var items = [];

	  $.each(data, function(key, val) {
	    items.push('<li id="' + key + '">' + val + '</li>');
	  });

	  $('<ul/>', {
	    'class': 'my-new-list',
	    html: items.join('')
	  }).appendTo('body');
	});
});
