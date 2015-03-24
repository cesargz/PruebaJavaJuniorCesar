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
        <p align="center"><strong>Registrar Album</strong></p>
              <form id="form1" name="form1" method="post" action="../GestionarAlbum.do" onsubmit="return validarRegistrarAlbum(this)">
              <table width="296" border="0" align="center">
                  <tr>
                    <td>C&oacutedigo del Album</td>
                    <td><label for="tfCodigo_Album"></label>
                    <input type="text" name="tfCodigo_Album" id="tfCodigo_Album" /></td>
                  </tr>
                  <tr>
                    <td>Nombre del Album</td>
                    <td><label for="tfNombre_Album"></label>
                    <input type="text" name="tfNombre_Album" id="tfNombre_Album" /></td>
                  </tr>
                  <tr>
                    <td>Descripci&oacute;n del Album</td>
                    <td><label for="tfDescripcion_Album"></label>
                    <input type="text" name="tfDescripcion_Album" id="tfDescripcion_Album" /></td>
                  </tr>
                  <tr>
                    <td>Año del Album</td>
                    <td><label for="tfYear_Album"></label>
                    <input type="text" name="tfYear_Album" id="tfYear_Album" /></td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      <div align="center">
                        <input type="hidden" name="bandera" id="bandera" value="RegistrarAlbum" />
                        <input type="reset" name="btnRestablecer" id="btnRestablecer" value="Restablecer" />
                        <input type="submit" name="btnRegistrarAlbum" id="btnRegistrarAlbum" value="Guardar" />
                      </div>
                    </td>
                  </tr>
                </table>
              </form>                
                
			
		<!-- TemplateEndEditable -->
	</div>
	<!-- final contenido -->
</div><!-- final contenedor -->

</body>
</html>

