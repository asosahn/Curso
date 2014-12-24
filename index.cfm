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
 	
 <cfset array = ['Sosa','Diaz']>
 <cfset struc.Nombre = 'Ramon'>
 <cfset struc.Apellido = 'Ramon'>
 <cfset struc.Apellidos = array>
 
 <cfset nose.informacion = struc>
 
 <cfscript>
 	WriteDump(array);
 </cfscript>	
 
 <cfdump var="#struc#" >
 <cfdump var="#nose#" >
 <cfloop array="#nose.informacion.apellidos#" index="i">
 	<cfoutput>
 		<h1>#i#</h1>
 	</cfoutput>
 </cfloop>
 <!---<cfdump var="#nose.informacion.apellidos[1]#" >--->
<!--- <cfset prueba =  [{
            name: 'John',
            data: [5, 3, 4, 7, 2]
        }, {
            name: 'Jane',
            data: [2, -2, -3, 2, 1]
        }, {
            name: 'Joe',
            data: [3, 4, 4, -2, 5]
        }]>
        
        <cfdump var="#prueba#" >--->
 	
<!---<cfset array = [
    {
        "id": 2,
        "name": "An ice sculpture",
        "price": 12.50,
        "tags": ["cold", "ice"],
        "dimensions": {
            "length": 7.0,
            "width": 12.0,
            "height": 9.5
        },
        "warehouseLocation": {
            "latitude": -78.75,
            "longitude": 20.4
        }
    },
    {
        "id": 3,
        "name": "A blue mouse",
        "price": 25.50,
        "dimensions": {
            "length": 3.1,
            "width": 1.0,
            "height": 1.0
        },
        "warehouseLocation": {
            "latitude": 54.4,
            "longitude": -32.7
        }
    }
]>--->

<!---<cfset array = ['Ramon','Sosa']>

<cfscript>
	array = ['Sosa','Diaz'];
	WriteDump(var)
</cfscript>
--->
<!---<cf_socialplugin type = "tweet"
url = "url to share"
tweettext = "default tweet text"
language = "en"
count = "none"
hashtag = "comma separated hash tags appended to
tweet text"
buttonsize = "large"
via = ""
recommend = ""
style = ""
extraoptions = ""
>--->
<!---<cfform>
	<label for="message">Your Message:</label><br />
<cftextarea richtext="true" name="message" skin="office2003" required="true" message="Please
enter a message to send."/>
</cfform>


<cfmap name="Mapa" zoomlevel="14" centeraddress="12 de octubre, Panama" >
	<cfmapitem >
</cfmap>--->

<!---<cfquery name="queryQ" datasource="eventos">
	select * from evento.premios
</cfquery>
<cfoutput>
	#serializeJSON(queryQ)#
</cfoutput>--->

<!---<cfinvoke method="estructura"  component="queries" returnvariable="data">
<cfinvokeargument name="query" value="#queryQ#" >
 </cfinvoke>
 
<cfquery name="queryQ" datasource="eventos">
	select * from evento.asistentes
</cfquery>

<cfinvoke method="estructura"  component="queries" returnvariable="data2">
<cfinvokeargument name="query" value="#queryQ#" >
 </cfinvoke>
<cfdump var="#data#" >
<cfdump var="#data2#" >--->
<!---<cfset columnas = queryQ.ColumnList>

<cfloop query="queryQ">
	<cfset asistentes = structNew()>
	<cfloop list="#columnas#" index="col">
		<cfset asistentes[lcase(col)] = queryQ[col][queryQ.CurrentRow]>
	</cfloop>
	<cfset array[queryQ.CurrentRow] = asistentes>
</cfloop>

<cfset data['data'] = array>
<cfset data['sesion'] = 'S'>
<cfdump var="#data#" >
--->
 <!---<cfset array = [10,11,12]>
 <cfset struc.Nombre = 'Andres'>
 <cfset struc.Apellido = ['Sosa','Diaz']>
 <cfdump var="#array#" >
 <cfdump var="#struc#" >--->
<!--- <cfdump var="#struc.Apellido[2]#" >--->
<!---<cfoutput>
	#serializeJSON(data)#
</cfoutput> --->	
 <script src="js/jquery-1.11.1.min.js"></script>
 <script>
 $( document ).ready(function() {
 	
 });	
 </script> 	
 </body>
 
</html>