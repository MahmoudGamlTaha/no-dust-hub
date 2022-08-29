var App = function () {

    var isMainPage = false;
  

   var handleMainMenu = function () {
        jQuery('#sidebar .has-sub > a').click(function () {
            var last = jQuery('.has-sub.open', $('#sidebar'));
            last.removeClass("open");
            jQuery('.arrow', last).removeClass("open");
            jQuery('.sub', last).slideUp(200);
            var sub = jQuery(this).next();
            if (sub.is(":visible")) {
                jQuery('.arrow', jQuery(this)).removeClass("open");
                jQuery(this).parent().removeClass("open");
                sub.slideUp(200);
            } else {
                jQuery('.arrow', jQuery(this)).addClass("open");
                jQuery(this).parent().addClass("open");
                sub.slideDown(200);
            }
        });
    }


   
    //  show/hide Sidebar.
    var handleSidebarToggler = function () {

        $('.sidebar-toggler').click(function () {
            if ($('#sidebar > ul').is(":visible") === true) {
                $('#main-content').css({
                    'margin-left': '25px'
                });
                $('#sidebar').css({
                    'margin-left': '-190px'
                });
                $('#sidebar > ul').hide();
                $("#container").addClass("sidebar-closed");
            } else {
               $('#main-content').css({
                    'margin-left': '215px'
                });
                $('#sidebar > ul').show();
                $('#sidebar').css({
                    'margin-left': '0'
                });
                $("#container").removeClass("sidebar-closed");
            }
        })
        
        
        
        
                $('.sidebar-togggler').click(function () {
            if ($('#sidebar > ul').is(":visible") === true) {
                $('#main-content').css({
                	  'margin-left': '0px' ,
                	 'margin-right': '25px' 
                    
                });
                $('#sidebar').css({
                	 'margin-left': '0px' ,
                    'margin-right': '-190px' 
                   
                });
                $('#sidebar > ul').hide();
                $("#container").addClass("sidebar-closed");
            } else {
               $('#main-content').css({
                    'margin-right': '215px' ,
                    'margin-left': '0px'
                });
                $('#sidebar > ul').show();
                $('#sidebar').css({
                    'margin-right': '0' ,
                'margin-left': '0px'
                });
                $("#container").removeClass("sidebar-closed");
            }
        })
        
        
    }

  
  return {

   
        init: function () {

            handleMainMenu(); 
            handleSidebarToggler();
           
        },

    };



}();







