var YakkaRouter = Backbone.Router.extend({
		routes: {
			'': 'index',
      'categories/:id': 'showCategory'
		},
  
    index: function() {
        alert(" ça marche mon gars 2X");
        view = new CategoryView({collection: all_categories,el:$("#container")});
      
    },
    
    showCategory: function (id) {
			alert(" category avec l'id " + id)
		}

		
	});