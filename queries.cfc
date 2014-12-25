<cfcomponent persistent="true" >

<cffunction name="estructura" access="remote"  returntype="struct" >
	<cfargument name="query" type="query" required="true" >
	
	<cfset columnas = arguments.query.ColumnList>

<cfloop query="#arguments.query#">
	<cfset asistentes = structNew()>
	<cfloop list="#columnas#" index="col">
		<cfset asistentes[lcase(col)] = arguments.query[col][arguments.query.CurrentRow]>
	</cfloop>
	<cfset array[arguments.query.CurrentRow] = asistentes>
</cfloop>

<cfset data['data'] = array>
<cfset data['sesion'] = 'S'>
	
<cfreturn data>
	
</cffunction>


<cffunction name="asistentes" access="remote"  returntype="any" returnformat="JSON" output="true" >
	
  <cftry>
  
	
	<cfquery name="asistentesQ" datasource="curso" maxrows="10">
		select * from rsosa.colaboradores
	</cfquery>
	
	<cfset colaboradores = estructura(asistentesQ)>
	
  	<cfcatch>
  		<cfoutput>
  		   #cfcatch.detail#	
  	    </cfoutput>
  	</cfcatch>
  </cftry>		
<!---<cfdump var="#asistentesQ#" >--->	
<!---<cfreturn estructura(asistentesQ)>--->
	
</cffunction>
</cfcomponent>