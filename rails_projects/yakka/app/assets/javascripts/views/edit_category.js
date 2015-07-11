EditCategory = Backbone.View.extend({
    //template:_.template("<div><a href='#categories/4'>hello</a>, <%= name %>, please go to <a href='#/lol'>coucou</a></div>"),
    template: JST['categories/edit'],
  
    tagName: 'form',
    
    events: {
      "submit": "saveModel"
    },
  
    initialize:function(){
      //constructeur
      //écouteur d'event
       this.render();
    },
    render:function(){
      //construire la vue
      this.$el.html(this.template({category: this.model}));
      return this;
    },
  
    saveModel: function(e){
      console.log(this.model.id);
      
      this.model.set("nom", this.$(".category-name").val());
      this.model.set("stat", this.$(".category-stat").val());
      Backbone.history.navigate('/', {trigger: true});
      return false;
    }
    
  
  
});