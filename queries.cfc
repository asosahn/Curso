<cfcomponent persistent="true" >

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


<cffunction name="asistentes" access="remote"  returntype="any" returnformat="JSON" output="true" >
	
  <cftry>
  
	
	<cfquery name="asistentesQ"  maxrows="10">
		select * from rsosa.colaboradores
	</cfquery>
	
	<cfset colaboradores.data = estructura(asistentesQ)>
	
	<cfloop from="1" to="#arrayLen(colaboradores.data)#" index="i">
		<cfquery name="hijosQ">
     		select * from rsosa.hijos where cod_colaborador = <cfqueryparam cfsqltype="cf_sql_varchar" value="#colaboradores.data[i].cod_colaborador#">
     	</cfquery>
    <cfset colaboradores.data[i].hijosA = estructura(hijosQ)>	
     
     <cfquery name="autos">
   			select * from rsosa.autos where cod_colaborador = <cfqueryparam cfsqltype="cf_sql_varchar" value="#colaboradores.data[i].cod_colaborador#">
   	</cfquery>
   	
   	<cfset colaboradores.data[i].autos = estructura(autos)>	
   	
   	<cfquery name="equipo">
   		select * from rsosa.colaboradores where supervisor = <cfqueryparam cfsqltype="cf_sql_varchar" value="#colaboradores.data[i].cod_colaborador#">
   	</cfquery>
   	   <!---<cfif equipo.RecordCount GT 0 >
   	   	<cfset colaboradores.data[i].equipo = estructura(equipo)>	
   	   	<cfelse>
   	   	<cfset colaboradores.data[i].equipo = "">	
   	   </cfif>--->
   		<cfset colaboradores.data[i].equipo = estructura(equipo)>	
   		
	</cfloop>
	
	
  <!--- <cfloop query="asistentesQ">
   	    
   		<cfif asistentesQ.hijos EQ 'S'>
     	<cfquery name="hijosQ">
     		select * from rsosa.hijos where cod_colaborador = <cfqueryparam cfsqltype="cf_sql_varchar" value="#asistentesQ.cod_colaborador#">
     	</cfquery>
     	    <!---<cfset colaboradores.data.hijosA = structnew()>--->
     	    <cfset hijosp = estructura(hijosQ)>
     		<cfset colaboradores.data[asistentesQ.CurrentRow].hijosA = hijosp>
   		</cfif>
   		<!---<cfquery name="autos">
   			select * from rsosa.autos where cod_colaborador = <cfqueryparam cfsqltype="cf_sql_varchar" value="#asistentesQ.cod_colaborador#">
   		</cfquery>
   		    <cfset colaboradores.data.autos = structnew()>
     	    <cfset autosp = estructura(autos)>
   			<cfset colaboradores.data[asistentesQ.CurrentRow].autos = autosp>--->
   </cfloop>--->
	
		
	
	
  	<cfcatch>
  		<cfoutput>
  		   #cfcatch.detail#	
  	    </cfoutput>
  	</cfcatch>
  </cftry>		
<!---<cfdump var="#colaboradores#" >	--->
<cfreturn colaboradores>
	
</cffunction>
</cfcomponent>