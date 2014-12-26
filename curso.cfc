<cfcomponent>
<!---	<cfinclude template="funciones.cfm" >--->
	
	<cffunction name="estructura" access="remote"  returntype="any" >
	<cfargument name="query" type="query" required="true" >
	
	<cfset columnas = arguments.query.ColumnList>
<cfset array = ArrayNew( 1 )>
<cfloop query="#arguments.query#">
	<cfset asistentes = structNew()>
	<cfloop list="#columnas#" index="col">
		<cfset asistentes[lcase(col)] = arguments.query[col][arguments.query.CurrentRow]>
	</cfloop>
	<cfset array[arguments.query.CurrentRow] = asistentes>
</cfloop>

<!---<cfset data['data'] = array>
<cfset data['sesion'] = 'S'>--->
	
<cfreturn array>
	
</cffunction>

<cffunction name="prueba" access="remote" returntype="any"  output="true" >
	
	<cfquery name="query">
		select * from rsosa.colaboradores
	</cfquery>
	
	<!---<cfdump var="#deserializeJSON(serializeJSON(query))#" >--->
	<cfreturn objeto(query)>
	
	
</cffunction>

<cffunction name="objeto" returntype="Any" access="remote" output="true" >
	<cfargument name="vquery" type="query" required="true" >
	
	
	<cfset columnas = arguments.vquery.ColumnList>
	<cfset data = arraynew(1)>
	
	<cfloop query="#arguments.vquery#">
		<cfset estructura = structnew()>
		<cfloop list="#columnas#" index="col">
			<cfset estructura[lcase(col)] = query[col][arguments.vquery.CurrentRow]>
		</cfloop>
		 <cfset data[arguments.vquery.CurrentRow] = estructura>
	</cfloop>
	
	<cfdump var="#data#" >
	<cfreturn data>
</cffunction>


<cffunction name="hijos" returntype="any" returnformat="JSON" access="remote" output="true" >
	
	<cfquery name="colaboradoresQ">
		select * from rsosa.colaboradores
	</cfquery>
	
	<cfset colaboradores = deserializeJSON(serializeJSON(colaboradoresQ))>
	
	<cfloop from="1" to="#arrayLen(colaboradores)#" index="i">
		<cfquery name="hijos">
			select * from rsosa.hijos where cod_colaborador = 
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#colaboradores[i].COD_COLABORADOR#">
		</cfquery>
		<cfset colaboradores[i].HIJOST = deserializeJSON(serializeJSON(hijos))>
		
		<cfquery name="autos">
			select * from rsosa.autos where cod_colaborador = 
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#colaboradores[i].COD_COLABORADOR#">
		</cfquery>
		
		<cfset colaboradores[i].AUTOST = deserializeJSON(serializeJSON(autos))>
		
	</cfloop>
	
	<cfreturn colaboradores>
	
</cffunction>





















</cfcomponent>