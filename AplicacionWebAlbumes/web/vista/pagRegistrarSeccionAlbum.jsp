<%-- 
    Document   : plantillaAplicacionWebAlbumes
    Author     : Cesar
--%>

<%@page import="Persistencia.ControlPersistencia"%>
<%@page import="Variables.VariablesGlobales"%>
<%@page import="Modelo.Album"%>
<%@page import="java.sql.ResultSet"%>

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
        <%
            Album album = new Album();
            ResultSet rs = album.mostrarAlbumes();
            String mensaje ="";
            if(rs!=null)
            {
                int numero_registros = 0;
                numero_registros = ControlPersistencia.getRowCount(rs);
                if(numero_registros >0)
                {
        %>
        <p align="center"><strong>Registrar Seccion de un Album</strong></p>
              <form id="form1" name="form1" method="post" action="../GestionarSeccion.do" onsubmit="return validarRegistrarSeccionAlbum(this)">
              <table width="296" border="0" align="center">
                  <tr>
                    <td>Nombre del Album</td>
                    <td><label for="select_Codigo_Album"></label>
                    <select name="select_Codigo_Album" id="select_Codigo_Album">
                    <%
                            rs.beforeFirst();
                            while(rs.next())
                            {
                    %>  
                               <option value="<% out.print(rs.getInt("codigo_album")); %>"><%out.print(rs.getString("nombre_album"));%></option>
                     <%
                            }//fin while
                     %>       
                    </select>
                    </td>
                  </tr>
                  <tr>
                    <td>Nombre de la Seccion</td>
                    <td><label for="tfNombre_Seccion"></label>
                    <input type="text" name="tfNombre_Seccion" id="tfNombre_Seccion" /></td>
                  </tr>
                  <tr>
                    <td>Numero de Hojas de la Seccion</td>
                    <td><label for="tfNumeroHojas_Seccion"></label>
                    <input type="text" name="tfNumeroHojas_Seccion" id="tfNumeroHojas_Seccion" /></td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      <div align="center">
                        <input type="hidden" name="bandera" id="bandera" value="RegistrarSeccion" />
                        <input type="reset" name="btnRestablecer" id="btnRestablecer" value="Restablecer" />
                        <input type="submit" name="btnRegistrarSeccion" id="btnRegistrarSeccion" value="Guardar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </form>                		
        <% 
              }//fin if
              else
              {     
                  mensaje = "No Existen Albumes en la Base de Datos!!!";

                  out.print("<script>");
                  out.print("alert('"+mensaje+"');");
                  out.print("</script>");
                  
                  out.print("<meta http-equiv='refresh'; content='0;URL=/AplicacionWebAlbumes'>");
              }
           }else
           {
              mensaje = "Error al Mostrar Albumes de la Base de Datos!!!"; 
              out.print("<script>");
              out.print("alert('"+mensaje+"');");
              out.print("</script>");
              out.print("<meta http-equiv='refresh'; content='0;URL=/AplicacionWebAlbumes'>");
           }
         %>
		<!-- TemplateEndEditable -->
	</div>
	<!-- final contenido -->
</div><!-- final contenedor -->

</body>
</html>

