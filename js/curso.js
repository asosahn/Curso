$(function () {

  $.ajax({
          	async: true,
            type: "POST",
            url: "queries.cfc?method=asistentes",
            // data: 'cedula=' + id + '&editsave=' + editsave + '&premioOption=' + $("#ddlPremioOption").val() + '&premioboleto=' + String($("#ddlPremio").val()) + "&turnocheck=" + Number($("#chk_turno").is(':checked')) + '&responsable=' + encodeURIComponent($("#txt_turno").val()),
            dataType: "json",
            beforeSend: function(){
            
            },
            success: function(data) {  
             console.log(data);
             console.log(data.data.length)
            },
            timeout: 10000,
            error: function(String) {
            	console.log(String);
                                      
            }            
        
        });
        
   
});