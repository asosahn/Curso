$(function () {

  $.ajax({
          	async: true,
            type: "POST",
            url: "queries.cfc?method=asistentes",
            // data: 'cedula=' + id + '&editsave=' + editsave + '&premioOption=' + $("#ddlPremioOption").val() + '&premioboleto=' + String($("#ddlPremio").val()) + "&turnocheck=" + Number($("#chk_turno").is(':checked')) + '&responsable=' + encodeURIComponent($("#txt_turno").val()),
            dataType: "json",
            // crossDomain: true,
            beforeSend: function(){
            
            },
            success: function(data) {  
             console.log(data);
             console.log(data.data.length);

             var html = '';

             $.each(data.data, function (index, colaborador) {
                html += '<article>';
                html += '<h2><strong>' + colaborador.primer_nombre + ' ' + colaborador.primer_apellido + '</strong></h2>';
                html += '<p><strong>Código Colaborador:</strong> ' + colaborador.cod_colaborador + '</p>'
                console.log(colaborador.primer_nombre);
                html += '<h3>Hijos:</h3>';
                 $.each(colaborador.hijosA, function(index, hijo){
                   console.log(hijo.primer_nombre + ' ' + hijo.primer_apellido);

                   html += '<ul>';
                    html += '<li>' + hijo.primer_nombre + ' ' + hijo.primer_apellido + '</li>'
                   html += '</ul>';

                });

                if (colaborador.equipo.length > 0){

                html += '<h3>Equipo:</h3>';
                  $.each(colaborador.equipo, function(index, equipo){
                     html += '<ul>';
                      html += '<li>' + equipo.primer_nombre + ' ' + equipo.primer_apellido + '</li>'
                     html += '</ul>';

                  });

                }

                 html += '<h4>Autos:</h4>';

                $.each(colaborador.autos, function(index, auto){
                   console.log(auto.placa);

                   html += '<ul>';
                    html += '<li>' + auto.placa + ' ' + auto.marca + ' ' + auto.modelo + '</li>'
                   html += '</ul>';

                });

               
               html += '</article>';   
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