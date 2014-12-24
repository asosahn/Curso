<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
  
    	
   </head>
    	
 <body>
 	
 
<cfquery name="qry" datasource="Eventos" maxrows="10">
	select * from ASISTENTES
</cfquery> 

<cfset q = queryNew('asistentes','VARCHAR')>

<cfloop query="qry" >
	<cfset queryAddRow(q)>
	<cfset querySetCell(q,'asistentes',qry.ASISTENTE)>
</cfloop>

<!---<cfoutput query="mysqlq">
	<li>#mysqlq.IDCLIENTE# #mysqlq.DESCLIENTE#</li><br>
</cfoutput>
--->




<!---<cfdump var="#union#" >--->
<cfdump var="#q#" >
<!---<cfdump var="#array#" >
<cfdump var="#numero#" >--->


 

 	
 </body>
 
</html>