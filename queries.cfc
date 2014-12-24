<cfcomponent>
<cffunction name="estructura" access="remote" returnformat="JSON" returntype="Any" >
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
	
<cfreturn serializeJSON(data)>
	
</cffunction>
</cfcomponent>