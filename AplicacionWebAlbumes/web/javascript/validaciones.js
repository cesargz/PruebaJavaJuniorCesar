function validarRegistrarAlbum(formulario){
	if(hayVaciosRegistrarAlbum(formulario))
	   return false;

        if(noEsNumeroRegistrarAlbum(formulario))
            return false;
        
        if(noEsStringRegistrarAlbum (formulario))
            return false;

}

function hayVaciosRegistrarAlbum(formulario){
	if(formulario.tfCodigo_Album.value == "" || formulario.tfNombre_Album.value == "" || formulario.tfDescripcion_Album.value == "" || formulario.tfYear_Album.value == "")
        {	alert("El codigo, el nombre, la descripcion y el año del album no pueden ser vacios");
		return true;
        }
}

function noEsNumeroRegistrarAlbum (formulario)
{
    if(isNaN(formulario.tfCodigo_Album.value))
    {
        alert("El valor del campo codigo del album debe ser númerico");
        formulario.tfCodigo_Album.value = "";
        return true;
    
    }
    
    if(isNaN(formulario.tfYear_Album.value))
    {
        alert("El valor del campo año del album debe ser númerico");
        formulario.tfYear_Album.value = "";
        return true;
    
    }
}

function noEsStringRegistrarAlbum (formulario)
{
    if(!tieneLetras(formulario.tfNombre_Album.value))
    {
        alert("El valor del campo nombre del album debe ser texto");
        formulario.tfNombre_Album.value = "";
        return true;
    }
    
    if(!tieneLetras(formulario.tfDescripcion_Album.value))
    {
        alert("El valor del campo descripcion del album debe ser texto");
        formulario.tfDescripcion_Album.value = "";
        return true;
    }
}

function validarBuscarAlbum(formulario){
	if(hayVaciosBuscarAlbum(formulario))
		return false;
        
        if(noEsNumeroBuscarAlbum(formulario))
            return false;
        
        if(noEsStringBuscarAlbum (formulario))
            return false;
}

function hayVaciosBuscarAlbum(formulario){
	if(formulario.select_Campo_Busqueda.value == "")
        {	alert("Seleccione el campo de búsqueda: Código del Album o Nombre del Album");
		return true;
        }
        if(formulario.tfCampo_Album.value == "")
        {	alert("El valor del campo no puede ser vacio");
		return true;
        }
}
function noEsNumeroBuscarAlbum (formulario)
{
    if(formulario.select_Campo_Busqueda.value == "codigo_album" && isNaN(formulario.tfCampo_Album.value))
    {
        alert("El valor del campo debe ser númerico");
        formulario.tfCampo_Album.value = "";
        return true;
    }

}

function noEsStringBuscarAlbum (formulario)
{
    if(formulario.select_Campo_Busqueda.value == "nombre_album" && !tieneLetras(formulario.tfCampo_Album.value))
    {
        alert("El valor del campo debe ser texto");
        formulario.tfCampo_Album.value = "";
        return true;
    }
}

function validarEditarAlbum(formulario){
	if(hayVaciosEditarAlbum(formulario))
	   return false;

        if(noEsNumeroEditarAlbum(formulario))
            return false;
        
        if(noEsStringEditarAlbum (formulario))
            return false;

}

function hayVaciosEditarAlbum(formulario){
	if(formulario.tfNombre_Album.value == "" || formulario.tfDescripcion_Album.value == "" || formulario.tfYear_Album.value == "")
        {	alert("El nombre, la descripcion y el año del album no pueden ser vacios");
		return true;
        }
}

function noEsNumeroEditarAlbum (formulario)
{
    if(isNaN(formulario.tfYear_Album.value))
    {
        alert("El valor del campo año del album debe ser númerico");
        formulario.tfYear_Album.value = "";
        return true;
    
    }
}

function noEsStringEditarAlbum (formulario)
{
    if(!tieneLetras(formulario.tfNombre_Album.value))
    {
        alert("El valor del campo nombre del album debe ser texto");
        formulario.tfNombre_Album.value = "";
        return true;
    }
    
    if(!tieneLetras(formulario.tfDescripcion_Album.value))
    {
        alert("El valor del campo descripcion del album debe ser texto");
        formulario.tfDescripcion_Album.value = "";
        return true;
    }
}

function validarRegistrarSeccionAlbum(formulario){
	if(hayVaciosRegistrarSeccionAlbum(formulario))
	   return false;

        if(noEsNumeroRegistrarSeccionAlbum(formulario))
            return false;
        
        if(noEsStringRegistrarSeccionAlbum(formulario))
            return false;

}

function hayVaciosRegistrarSeccionAlbum(formulario){
	if(formulario.tfNombre_Seccion.value == "" || formulario.tfNumeroHojas_Seccion.value == "")
        {	alert("El nombre y el numero de hojas de la seccion no pueden ser vacios");
		return true;
        }
}

function noEsNumeroRegistrarSeccionAlbum(formulario)
{
    if(isNaN(formulario.tfNumeroHojas_Seccion.value))
    {
        alert("El numero de hojas de la seccion debe ser númerico");
        formulario.tfNumeroHojas_Seccion.value = "";
        return true;
    
    }
}

function noEsStringRegistrarSeccionAlbum(formulario)
{
    if(!tieneLetras(formulario.tfNombre_Seccion.value))
    {
        alert("El valor del campo nombre de la seccion debe ser texto");
        formulario.tfNombre_Seccion.value = "";
        return true;
    }
    
}

function tieneLetras(texto)
{
   letras="abcdefghyjklmnñopqrstuvwxyz";
   
   texto = texto.toLowerCase();
   for(i=0; i<texto.length; i++)
   {
      if (letras.indexOf(texto.charAt(i),0)!=-1)
          return true;
   }
   return false;

}
