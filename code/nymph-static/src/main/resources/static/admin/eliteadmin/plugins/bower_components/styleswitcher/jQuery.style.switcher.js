// Theme color settings
var $ctx='';
$(document).ready(function(){
function store(name, val) {
    if (typeof (Storage) !== "undefined") {
      localStorage.setItem(name, val);
    } else {
      window.alert('Please use a modern browser to properly view this template!');
    }
  }

 $("*[theme]").click(function(e){
      e.preventDefault();
        var currentStyle = $(this).attr('theme');
        store('theme', currentStyle);
        $('#theme').attr({href: $ctx+'/static/eliteadmin/eliteadmin-inverse/css/colors/'+currentStyle+'.css'})
    });

    var currentTheme = get('theme');
    if(currentTheme){
      $('#theme').attr({href: $ctx+'/static/eliteadmin/eliteadmin-inverse/css/colors/'+currentTheme+'.css'});
      $('#themecolors a[theme="'+currentTheme+'"]').addClass('working')
    }
    // color selector
    $('#themecolors').on('click', 'a', function(){
        $('#themecolors li a').removeClass('working');
        $(this).addClass('working')
      });

});


 function get(name) {
	 return localStorage['theme'];
  }
 /*
$(document).ready(function(){
    $("*[theme]").click(function(e){
      e.preventDefault();
        var currentStyle = $(this).attr('theme');
        //store('theme', currentStyle);
        $('#theme').attr({href: $ctx+'/static/eliteadmin/eliteadmin-inverse/css/colors/'+currentStyle+'.css'})
    });

    var currentTheme = get('theme');
    if(currentTheme)
    {
      $('#theme').attr({href: $ctx+'/static/eliteadmin/eliteadmin-inverse/css/colors/'+currentTheme+'.css'});
    }
    // color selector
$('#themecolors').on('click', 'a', function(){
        $('#themecolors li a').removeClass('working');
        $(this).addClass('working')
      });
});*/
