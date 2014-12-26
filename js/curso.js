$(function () {
	
  $.ajax({
          	async: true,
            type: "POST",
            url: "curso.cfc?method=hijos",
           
            dataType: "json",
           
            beforeSend: function(){
            
            },
            success: function(data) {  
            	//data = JSON.parse(data);
             console.log(data);
           var html = '';
           $.each(data, function(index, colaborador){
            html += '<div id="' + colaborador.COD_COLABORADOR +'">';
            html += '<h1>' + colaborador.PRIMER_NOMBRE + ' ' + colaborador.PRIMER_APELLIDO + '</h1>';
            html += '<p><strong>' + colaborador.PUESTO + '</strong></p>';
            	
            	console.log(colaborador.PRIMER_NOMBRE + ' ' + colaborador.PRIMER_APELLIDO);
            	html += '<h2>Hijos:</h2>';
            	html += '<ul>';
            	$.each(colaborador.HIJOST, function(index, hijos){
            		console.log(hijos.PRIMER_NOMBRE + ' ' + hijos.PRIMER_APELLIDO);
            		
            		html += '<li>' + hijos.PRIMER_NOMBRE + ' ' + hijos.PRIMER_APELLIDO + '</li>';
            			
            		
            	});
            	html += '</ul>';
            	html += '<h2>Autos:</h2>';
            	
            	html += '<ul>';
            	$.each(colaborador.AUTOST, function(index, auto){
            		console.log(auto.PLACA + ' ' + auto.MARCA);
            		html += '<li>' + auto.PLACA + ' ' + auto.MARCA + '</li>';
            	});
            		html += '</ul>';
            html+='</div>';
            });
			$("#contenido").html(html);
			
			
            },
            timeout: 10000,
            error: function(jqXHR, textStatus, ex) {
              alert(textStatus + "," + ex + "," + jqXHR.statusText);
              
                  },
          statusCode: {
            404: function() {
            alert( "page not found" );
                            }
                      }        
        
        });
        
   
});