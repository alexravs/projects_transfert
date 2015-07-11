CategoryView = Backbone.View.extend({
    //template:_.template("<div><a href='#categories/4'>hello</a>, <%= name %>, please go to <a href='#/lol'>coucou</a></div>"),
    template: JST['categories/index'],
    events: {
      'click a.menu':'showCategory',
      
    },
  
    initialize:function(){
      //constructeur
      //écouteur d'event
       this.render();
    },
    render:function(){
      //construire la vue
      console.log("test" );
      console.log( this.collection);
      this.$el.html(this.template({categories: this.collection}));
      return this;
    },
    
    showCategory: function(e){
      $this = $(e.currentTarget);
      url = $this.attr("href");
      
      Backbone.history.navigate("#" + url, {trigger:true});
      e.preventDefault();
      
    }
  
  
});