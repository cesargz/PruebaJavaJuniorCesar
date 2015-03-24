<%-- 
    Document   : plantillaAplicacionWebAlbumes
    Author     : Cesar
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Album"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Variables.VariablesGlobales"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>Aplicacion Web de Albumes</title>
<!-- TemplateEndEditable -->
<link href="../css/estilos.css" rel="stylesheet" type="text/css" />
<!-- TemplateBeginEditable name="head" --><!-- TemplateEndEditable -->

<!-- Invocamos javascript validador-->
<script type="text/javascript" src="../javascript/validaciones.js"></script>
</head>

<body>

<div id="contenedor">
	<div id="cabezera">	
	</div> <!-- final cabezera -->	
	<div id="navMenu">	
		<ul>
			<li><a href="#">Album</a>
				<ul>
					<li><a href="../vista/pagRegistrarAlbum.jsp">Registrar Album</a>
                                        <li><a href="../vista/pagBuscarAlbum.jsp">Buscar Album</a>
                                        <li><a href="../vista/pagMostrarAlbumes.jsp">Mostrar Albumes</a>    
				</ul><!-- final UL interno -->
			</li><!-- final LI principal -->
                        <li><a href="#">Seccion de Album</a>
				<ul>
					<li><a href="../vista/pagRegistrarSeccionAlbum.jsp">Registrar Seccion de un Album</a>
                                        <li><a href="../vista/pagSeleccionarAlbum.jsp">Mostrar Secciones de un Album</a>
                                        <!--<li><a href=""></a> -->   
				</ul><!-- final UL interno -->
			</li><!-- final LI principal -->
		</ul><!-- final UL principal -->
				
		<br class="clearFloat"/>
	</div>
	<!-- final navMenu -->
	<div id="contenido">
		<!-- TemplateBeginEditable name="EditRegion3" --> 
    <p>
          
   <%
      String indiceEditar = request.getParameter("indiceEditar");
      HttpSession sesedit_albumes=request.getSession(true);
      Vector <Album> albumes = (Vector<Album>)sesedit_albumes.getAttribute("sesedit_albumes");                        
      Album album = albumes.elementAt(Integer.parseInt(indiceEditar));
      HttpSession sesion_editar_album=request.getSession(true);
      sesion_editar_album.setAttribute("sesion_editar_album", album);
   %>
 
    </p>
    <p align="center"><strong>Editar Album</strong></p>
	<form id="form1" name="form1" method="post" action="../GestionarAlbum.do" onsubmit="return validarEditarAlbum(this)">
	    <table width="352" height="115" border="0" align="center">
          <tr bgcolor="#CCCCCC">
              <td width="381" height="109" valign="middle"><table width="425" border="0">
                  <tr valign="baseline" bgcolor="#CCCCCC">
                    <th width="174" height="24" nowrap="nowrap">Nombre del Album</th>
                    <th width="241" nowrap="nowrap"><div align="left">
                        <label>
                            <input name="tfNombre_Album" type="text" id="tfNombre_Album" value= "<% out.print(album.getNombre_Album()); %>" size="40"/>
                        </label>
                    </div></th>
                  </tr>
                  <tr valign="baseline">
                    <th nowrap="nowrap">Descripcion del Album</th>
                    <td><label>
                            <input name="tfDescripcion_Album" type="text" id="tfDescripcion_Album" value= "<%out.print(album.getDescripcion_Album()); %>" size="40"/>
                      </label>
                    </td>
                  </tr>
                  <tr valign="baseline">
                    <th nowrap="nowrap">Año del Album</th>
                    <td><label>
                            <input name="tfYear_Album" type="text" id="tfYear_Album" value= "<%out.print(album.getYear_Album()); %>" size="40"/>
                      </label>
                    </td>
                  </tr>
                  <tr valign="baseline">
                    <th height="24" nowrap="nowrap">&nbsp;</th>
              <td>&nbsp;</td>
                  </tr>
                  </table>
                <div align="right">
                    <input type="hidden" name="bandera" value="EditarAlbum" />
                    <input type="reset" name="btnRestablecer" id="btnRestablecer" value="Restablecer" />
                    <input name="btnEditar" type="submit" id="btnEditar" value="Guardar" />
                </div>
                </label>
              <div align="right"></div></td>
          </tr>
          </table>
	  </form>			
		<!-- TemplateEndEditable -->
	</div>
	<!-- final contenido -->
</div><!-- final contenedor -->

</body>
</html>

