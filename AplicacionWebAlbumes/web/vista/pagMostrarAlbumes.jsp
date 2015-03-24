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
<%@page import="java.sql.ResultSet"%>
<%@page import="Persistencia.ControlPersistencia"%>

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
ResultSet rs=null;
Album album = null;

if(VariablesGlobales.nombre_sesion.equals("BuscarAlbum"))                           
{

   HttpSession sesion_mostrar_album=request.getSession(true);
   rs = (ResultSet)sesion_mostrar_album.getAttribute("album");
}
else
{
  album = new Album();
  rs = album.mostrarAlbumes();
  album = null;

}
String mensaje ="";
if(rs!=null)
{
    int numero_registros = 0;
    numero_registros = ControlPersistencia.getRowCount(rs);
    if(numero_registros > 0)
    {
      VariablesGlobales.nombre_sesion="";
     %>                
        <p align="center"><strong>Albumes</strong></p>
        <div align="center"></div>
        <div align="justify"></div>
        <div align="center"></div>
        <div align="center">
            <table width="1108" height="56" border="1" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#CCCCCC">
                <tr align="center" bordercolor="#E7E3E7" bgcolor="#CCCCCC">
                    <th width="104" nowrap="nowrap">C&oacute;digo</th>
                    <th width="284" height="19" nowrap="nowrap">
                        <div align="left" class="style21">
                            <div align="center">Nombre </div>
                        </div>
                    </th>
                    <th width="132" nowrap="nowrap">
                        <div align="left" class="style21">
                            <div align="center">Descripcion</div>
                        </div>
                    </th>
                    <th width="211" nowrap="nowrap">
                        <div align="left" class="style21">
                            <div align="center">Año</div>
                        </div>
                    </th>
                    <!--<th width="104" nowrap="nowrap">
                        <div align="left" class="style21">
                            <div align="center">Stock</div>
                        </div>
                    </th>-->
                    <th colspan="3" nowrap="nowrap" bgcolor="#FFFFFF">
                        <div align="left" class="style21">
                            <div align="center"></div>
                        </div>
                        <div align="left" class="style21">
                            <div align="center"></div>
                        </div>              
                        <div align="left" class="style21">
                            <div align="center"></div>
                        </div>
                    </th>
                </tr>
    <%  
       Vector <Album> albumes = new Vector<Album>();
       int cont_albumes = 0;
       rs.beforeFirst();
       while(rs.next())
       {
         album = new Album();
         album.setAll(rs.getInt("codigo_album"), rs.getString("nombre_album"), rs.getString("descripcion_album"), rs.getInt("year_album"));
    %>
    <tr bgcolor="#FFFFFF">
      <td align="center" valign="top"><div align="justify"><% out.print(album.getCodigo_Album());%></div></td>
      <td height="28" align="center" valign="top"><div align="justify"><% out.print(album.getNombre_Album());%></div></td>
      <td align="center" valign="top"><div align="justify"><% out.print(album.getDescripcion_Album());%></div></td>
      <td align="center" valign="top"><div align="justify"><% out.print(album.getYear_Album());%></div></td>
      <!--<td align="center" valign="top"><div align="justify"><% //out.print(medicamento.getStock_Medicamento());%></div></td>-->
    <% 
        albumes.add(cont_albumes, album);

    %>
       <td width="49" align="center" valign="top">
            <form id="form1" name="form1" method="post" action="pagEditarAlbum.jsp">
                <%
                        HttpSession sesedit_albumes=request.getSession(true);
                        sesedit_albumes.setAttribute("sesedit_albumes", albumes);
                %>      
                <input type="hidden" name="indiceEditar" id="indiceEditar" value="<% out.print(cont_albumes);%>" />
                <input type="submit" name="btnEditar" id="btnEditar" value="Editar" />
            </form>
       </td>
       <td width="62" align="center" valign="top">
            <form id="form2" name="form2" method="post" action="../GestionarAlbum.do" onclick="return confirm('Esta seguro de eliminar este Album?')">
                <%
                    HttpSession seselim_albumes=request.getSession(true);
                    seselim_albumes.setAttribute("seselim_albumes", albumes);
                %>
                <input type="hidden" name="indiceEliminar" id="indiceEliminar" value="<% out.print(cont_albumes);%>"/>
                <input type="hidden" name="bandera" id="bandera" value="EliminarAlbum" />
                <input type="submit" name="btnEliminar" id="btnEliminar" value="Eliminar" />
            </form>
       </td>
    </tr>
    <%
          cont_albumes++;
       }//fin while

    %>
            </table>
    <%

    }//fin if
    else
    {
         if(VariablesGlobales.nombre_sesion.equals("BuscarAlbum"))
            mensaje = "El Album No Existe en la Base de Datos!!!";
         else mensaje = "No Existen Albumes en la Base de Datos!!!";

         out.print("<script>");
         out.print("alert('"+mensaje+"');");
         out.print("</script>");
         
         if(VariablesGlobales.nombre_sesion.equals("BuscarAlbum"))
            out.print("<meta http-equiv='refresh'; content='0;URL=../vista/pagBuscarAlbum.jsp'>");
         else out.print("<meta http-equiv='refresh'; content='0;URL=/AplicacionWebAlbumes'>");
         
         VariablesGlobales.nombre_sesion="";

    }
}//fin if
else
{
    if(VariablesGlobales.nombre_sesion.equals("BuscarAlbum"))
        mensaje = "Error al Mostrar Album de la Base de Datos!!!";
    else mensaje = "Error al Mostrar Albumes de la Base de Datos!!!";

    out.print("<script>");
    out.print("alert('"+mensaje+"');");
    out.print("</script>");
    
    if(VariablesGlobales.nombre_sesion.equals("BuscarAlbum"))
        out.print("<meta http-equiv='refresh'; content='0;URL=../vista/pagBuscarAlbum.jsp'>");
    else out.print("<meta http-equiv='refresh'; content='0;URL=/AplicacionWebAlbumes'>");
    
    VariablesGlobales.nombre_sesion="";
}
    
%>
                     
		<!-- TemplateEndEditable -->
	</div>
	<!-- final contenido -->
</div><!-- final contenedor -->

</body>
</html>

