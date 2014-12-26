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