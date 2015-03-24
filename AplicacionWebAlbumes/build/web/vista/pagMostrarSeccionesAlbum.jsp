<%-- 
    Document   : plantillaAplicacionWebAlbumes
    Author     : Cesar
--%>

<%@page import="Modelo.Seccion"%>
<%@page import="java.util.Vector"%>
<%@page import="Persistencia.ControlPersistencia"%>
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
ResultSet rs=null;
Seccion seccion = null;

HttpSession sesion_mostrar_secciones_album=request.getSession(true);
rs = (ResultSet)sesion_mostrar_secciones_album.getAttribute("sesion_mostrar_secciones_album");

String mensaje ="";
if(rs!=null)
{
    int numero_registros = 0;
    numero_registros = ControlPersistencia.getRowCount(rs);
    if(numero_registros > 0)
    {
      
     %>                
        <p align="center"><strong>Secciones del Album</strong></p>
        <div align="center"></div>
        <div align="justify"></div>
        <div align="center"></div>
        <div align="center">
            <table width="1108" height="56" border="1" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#CCCCCC">
                <tr align="center" bordercolor="#E7E3E7" bgcolor="#CCCCCC">
                    <th width="104" nowrap="nowrap">C&oacute;digo</th>
                    <th width="284" height="19" nowrap="nowrap">
                        <div align="left" class="style21">
                            <div align="center">Orden </div>
                        </div>
                    </th>
                    <th width="132" nowrap="nowrap">
                        <div align="left" class="style21">
                            <div align="center">Nombre</div>
                        </div>
                    </th>
                    <th width="211" nowrap="nowrap">
                        <div align="left" class="style21">
                            <div align="center">Numero de Hojas</div>
                        </div>
                    </th>
                </tr>
    <%  
       //Vector <Seccion> secciones = new Vector<Seccion>();
       //int cont_secciones = 0;
       rs.beforeFirst();
       while(rs.next())
       {
         seccion = new Seccion();
         seccion.setAll_Dos(rs.getInt("codigo_seccion"), rs.getInt("orden_seccion"), rs.getString("nombre_seccion"), rs.getInt("numerohojas_seccion"), rs.getInt("codigo_album"));
    %>
    <tr bgcolor="#FFFFFF">
      <td align="center" valign="top"><div align="justify"><% out.print(seccion.getCodigo_Seccion());%></div></td>
      <td height="28" align="center" valign="top"><div align="justify"><% out.print(seccion.getOrden_Seccion());%></div></td>
      <td align="center" valign="top"><div align="justify"><% out.print(seccion.getNombre_Seccion());%></div></td>
      <td align="center" valign="top"><div align="justify"><% out.print(seccion.getNumeroHojas_Seccion());%></div></td>
    </tr>
    <%
          //cont_secciones++;
       }//fin while

    %>
            </table>
    <%

    }//fin if
    else
    {
          
         mensaje = "No Existen Secciones en la Base de Datos!!!";
         out.print("<script>");
         out.print("alert('"+mensaje+"');");
         out.print("</script>");
         out.print("<meta http-equiv='refresh'; content='0;URL=../vista/pagSeleccionarAlbum.jsp'>");

    }
}//fin if
else
{
    mensaje = "Error al Mostrar Albumes de la Base de Datos!!!";
    out.print("<script>");
    out.print("alert('"+mensaje+"');");
    out.print("</script>");
    out.print("<meta http-equiv='refresh'; content='0;URL=../vista/pagSeleccionarAlbum.jsp'>");

}
    
%>			
                
		<!-- TemplateEndEditable -->
	</div>
	<!-- final contenido -->
</div><!-- final contenedor -->

</body>
</html>

