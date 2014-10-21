package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<html> \n");
      out.write("                         <head> \n");
      out.write("                             <meta charset=\"utf-8\"> \n");
      out.write("                             <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> \n");
      out.write("                             <title>BIENVENIDA A NUESTRA FERRETERIA</title> \n");
      out.write("                             <!-- All Stylesheets --> \n");
      out.write("                             <link rel=\"stylesheet\"  href=\"css/All-Stylesheets.css\"> \n");
      out.write("                             <!-- Add 2 Home --> \n");
      out.write("                    \n");
      out.write("                             <script type=\"text/javascript\" src=\"js/add2home.js\" charset=\"utf-8\"></script> \n");
      out.write("                             <!-- Javascript File --> \n");
      out.write("                             <script src=\"js/jquery.js\"></script> \n");
      out.write("                             <script type=\"text/javascript\" src=\"js/jquery-1.7.1.min.js\"></script> \n");
      out.write("                             <!-- Donut Chart --> \n");
      out.write("                             <script type=\"text/javascript\" src=\"js/jquery.donutchart.js\"></script> \n");
      out.write("                             <!-- jQuery Mobile --> \n");
      out.write("                             <script src=\"js/jquery.mobile-1.3.2.min.js\"></script> \n");
      out.write("                             <!-- Glyphicons --> \n");
      out.write("                             <script type=\"text/javascript\" async src=\"js/glyphicons/ga.js\"></script> \n");
      out.write("                         </head>);\n");
      out.write("        <body> \n");
      out.write("                             <div data-role=\"page\" id=\"page\" data-theme=\"a\"> \n");
      out.write("                                 <!-- header Starts --> \n");
      out.write("                                 <div data-role=\"header\" data-theme=\"f\" class=\"header\"> \n");
      out.write("                                     <h1><a href=\"index.html\" rel=\"external\">FERRETERIA ANTUNEZ</a></h1> \n");
      out.write("                                     <a href=\"#left-panel\" data-shadow=\"false\" ><i class=\"fa fa-indent fa-2x\"></i></a> \n");
      out.write("                                     <a href=\"#right-panel\" data-shadow=\"false\" ><i class=\"fa fa-bars fa-2x\"></i></a> \n");
      out.write("                                 </div> \n");
      out.write("                                 <!-- header Ends --> \n");
      out.write("                                 <div data-role=\\\"content\\\"> \n");
      out.write("                                     <!-- Welcome Text Starts --> \n");
      out.write("                                 </div> \n");
      out.write("                                 <div data-role=\"panel\" id=\"left-panel\" data-theme=\"g\"> \n");
      out.write("                                     <div id=\"accordion\"> \n");
      out.write("                                         <ul id=\"items\"> \n");
      out.write("                                             <li> \n");
      out.write("                                                 <a href=\"index.jsp\" rel=\"external\" class=\"activated\"></i>INICIO</a> \n");
      out.write("                                             </li> \n");
      out.write("                                             <li> \n");
      out.write("                                                 <a href=\"#\"></i>General</a> \n");
      out.write("                                                 <ul class=\"sub-items\"> \n");
      out.write("                                                     <li> \n");
      out.write("                                                         <a href='Comprar'>Comprar</a> \n");
      out.write("                                                     </li> \n");
      out.write("                                                     <li> \n");
      out.write("                                                         <a href='VerHistorialMio'>Historial</a> \n");
      out.write("                                                     </li> \n");
      out.write("                                                     <li> \n");
      out.write("                                                         <a href='LogOut'>Salir</a> \n");
      out.write("                                                     </li> \n");
      out.write("                                                 </ul> \n");
      out.write("                                             </li> \n");
      out.write("                                  </ul> \n");
      out.write("                                 </div> \n");
      out.write("                                 </div> \n");
      out.write("                                 <div data-role=\"panel\" id=\"right-panel\" data-position=\"right\" data-theme=\"g\"> \n");
      out.write("                                </div>\n");
      out.write("                             <script src=\"owl-carousel/owl-carousel/owl.carousel.js\"></script> \n");
      out.write("                             <!-- Custom JS File --> \n");
      out.write("                             <script src=\"js/custom.js\"></script>  \n");
      out.write("                             <script src=\"menu/js/main.js\"></script>     \n");
      out.write("                             <script>window.jQuery ||\n");
      out.write("                             document.write('<script src=\"flexslider/js/libs/jquery-1.7.min.js\">\\\\x3C/script>')</script> \n");
      out.write("                             <!-- FlexSlider -->  \n");
      out.write("                             <script defer src=\"flexslider/jquery.flexslider.js\"></script>\n");
      out.write("                             <script type=\"text/javascript\"> \n");
      out.write("                                 $(function(){\n");
      out.write("                                   SyntaxHighlighter.all()\n");
      out.write("                                 }\n");
      out.write("                                 $(window).load(function(){ \n");
      out.write("                                   $('#carousel').flexslider({ \n");
      out.write("                                     animation: \"slide\", \n");
      out.write("                                     controlNav: false, \n");
      out.write("                                     animationLoop: false, \n");
      out.write("                                     slideshow: false, \n");
      out.write("                                     itemWidth: 108, \n");
      out.write("                                     itemMargin: 0, \n");
      out.write("                                     asNavFor: '#slider' \n");
      out.write("                                   }); \n");
      out.write("                                  \n");
      out.write("                                   $('#slider').flexslider({ \n");
      out.write("                                     animation: \"slide\", \n");
      out.write("                                     controlNav: false, \n");
      out.write("                                     animationLoop: false, \n");
      out.write("                                     slideshow: false, \n");
      out.write("                                     sync: \\\"#carousel\\\", \n");
      out.write("                                     start: function(slider){ \n");
      out.write("                                       $('body').removeClass('loading');\n");
      out.write("                                     } \n");
      out.write("                                   });\n");
      out.write("                                 }); \n");
      out.write("                             </script> \n");
      out.write("                             <!-- Retina Display --> \n");
      out.write("                             <script src=\"js/Retina/retina.js\"></script> \n");
      out.write("                         </body> \n");
      out.write("                     </html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
