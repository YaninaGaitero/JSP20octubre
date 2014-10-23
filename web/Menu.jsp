<%-- 
    Document   : Menu
    Created on : 09/10/2014, 19:53:44
    Author     : alumno
--%>
<%@page import="Modelo.Usuario"%>
<jsp:include page="Validaciones/ValidComun.jsp" />
<html> 
                         <head> 
                             <meta charset="utf-8"> 
                             <meta name="viewport" content="width=device-width, initial-scale=1"> 
                             <title>BIENVENIDA A NUESTRA FERRETERIA</title> 
                             <!-- All Stylesheets --> 
                             <link rel="stylesheet"  href="css/All-Stylesheets.css"> 
                             <!-- Add 2 Home --> 
                    
                             <script type="text/javascript" src="js/add2home.js" charset="utf-8"></script> 
                             <!-- Javascript File --> 
                             <script src="js/jquery.js"></script> 
                             <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script> 
                             <!-- Donut Chart --> 
                             <script type="text/javascript" src="js/jquery.donutchart.js"></script> 
                             <!-- jQuery Mobile --> 
                             <script src="js/jquery.mobile-1.3.2.min.js"></script> 
                             <!-- Glyphicons --> 
                             <script type="text/javascript" async src="js/glyphicons/ga.js"></script> 
                         </head>);
        <body> 
                             <div data-role="page" id="page" data-theme="a"> 
                                 <!-- header Starts --> 
                                 <div data-role="header" data-theme="f" class="header"> 
                                     <h1><a href="index.html" rel="external">FERRETERIA ANTUNEZ</a></h1> 
                                     <a href="#left-panel" data-shadow="false" ><i class="fa fa-indent fa-2x"></i></a> 
                                     <a href="#right-panel" data-shadow="false" ><i class="fa fa-bars fa-2x"></i></a> 
                                 </div> 
                                 <!-- header Ends --> 
                                 <div data-role=\"content\"> 
                                     <!-- Welcome Text Starts --> 
                                 </div> 
                                 <div data-role="panel" id="left-panel" data-theme="g"> 
                                     <div id="accordion"> 
                                         <ul id="items"> 
                                             <li> 
                                                 <a href="index.html" rel="external" class="activated"></i>INICIO</a> 
                                             </li> 
                                             <li> 
                                                 <a href="#"></i>General</a> 
                                                 <ul class="sub-items"> 
                                                     <li> 
                                                         <a href='Comprar.jsp'>Comprar</a> 
                                                     </li> 
                                                     <li> 
                                                         <a href='VerHistorialMio.jsp'>Historial</a> 
                                                     </li> 
                                                     <li> 
                                                         <a href='LogOut.jsp'>Salir</a> 
                                                     </li> 
                                                 </ul> 
                                             </li> 
                                  </ul> 
                                 </div> 
                                 </div> 
                                 <div data-role="panel" id="right-panel" data-position="right" data-theme="g"> 
                                </div>
                             <script src="owl-carousel/owl-carousel/owl.carousel.js"></script> 
                             <!-- Custom JS File --> 
                             <script src="js/custom.js"></script>  
                             <script src="menu/js/main.js"></script>     
                             <script>window.jQuery ||
                             document.write('<script src="flexslider/js/libs/jquery-1.7.min.js">\\x3C/script>')</script> 
                             <!-- FlexSlider -->  
                             <script defer src="flexslider/jquery.flexslider.js"></script>
                             <script type="text/javascript"> 
                                 $(function(){
                                   SyntaxHighlighter.all()
                                 }
                                 $(window).load(function(){ 
                                   $('#carousel').flexslider({ 
                                     animation: "slide", 
                                     controlNav: false, 
                                     animationLoop: false, 
                                     slideshow: false, 
                                     itemWidth: 108, 
                                     itemMargin: 0, 
                                     asNavFor: '#slider' 
                                   }); 
                                  
                                   $('#slider').flexslider({ 
                                     animation: "slide", 
                                     controlNav: false, 
                                     animationLoop: false, 
                                     slideshow: false, 
                                     sync: \"#carousel\", 
                                     start: function(slider){ 
                                       $('body').removeClass('loading');
                                     } 
                                   });
                                 }); 
                             </script> 
                             <!-- Retina Display --> 
                             <script src="js/Retina/retina.js"></script> 
                         </body> 
                     </html>
