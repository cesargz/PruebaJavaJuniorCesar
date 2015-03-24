<%-- 
    Document   : plantillaAplicacionWebAlbumes
    Author     : Cesar
--%>

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
        <div align="center">
        <p><strong>Buscar Album</strong></p>
        <form id="form1" name="form1" method="post" action="../GestionarAlbum.do" onsubmit="return validarBuscarAlbum(this)">
          <table width="302" border="0">
            <tr>
              <td width="141">Buscar Por:</td>
              <td width="151"><label for="select_Campo_Busqueda"></label>
                <div align="left">
                    
                  <select name="select_Campo_Busqueda" id="select_Campo_Busqueda">
                    <option value="">Seleccione:</option>  
                    <option value="codigo_album">C&oacute;digo del Album</option>
                    <option value="nombre_album">Nombre del Album</option>
                  </select>
                </div>
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><label for="tfCampo_Album"></label>
                  <div align="left">
                      <input name="tfCampo_Album" type="text" id="tfCampo_Album" size="30" />
                  </div>
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>
                <div align="left">
                  <input type="hidden" name="bandera" id="bandera" value="BuscarAlbum" />                
                  <input type="submit" name="btnBuscar" id="btnBuscar" value="Buscar" />
                </div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
        </form>
      </div>                
		<!-- TemplateEndEditable -->
	</div>
	<!-- final contenido -->
</div><!-- final contenedor -->

</body>
</html>

