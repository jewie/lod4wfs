<%@ page import="java.io.*"%>
<%@ page import="de.ifgi.lod4wfs.core.*"%>
<%@ page import="de.ifgi.lod4wfs.facade.*"%>
<%@ page import="de.ifgi.lod4wfs.factory.*"%>
<%@ page import="com.hp.hpl.jena.query.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.hp.hpl.jena.query.ARQ"%>
<%@ page import="java.net.URLEncoder"%>
<html>
<link rel="stylesheet" href="http://data.uni-muenster.de/php/sparql/lib/codemirror/codemirror.css">
<script src="http://data.uni-muenster.de/php/sparql/lib/codemirror/codemirror.js"></script>
<link rel="stylesheet" href="http://data.uni-muenster.de/php/sparql/lib/codemirror/theme/default.css">
<script src="http://data.uni-muenster.de/php/sparql/lib/codemirror/mode.sparql.js"></script>
<link rel="stylesheet" href="http://data.uni-muenster.de/php/sparql/lodum.sparqleditor.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="http://data.uni-muenster.de/php/sparql/lib/jquery.getUrlParam.js"></script>
<script src="http://data.uni-muenster.de/php/sparql/lodum.sparqleditor.js"></script>
<head>
<title>LOD4WFS Administration Interface</title>
</head>
<%
	//Create function getSPARQLFeature(String fileName);
	WFSFeature feature = new WFSFeature();
	if(request.getParameter("edit")!=null){
		feature = Facade.getInstance().getSPARQLFeature(request.getParameter("edit"));
	}
	%>
<body>
<div class="bs-docs-featurette">
  <div class="container">
    <h2 class="bs-docs-featurette-title">LOD4WFS Administration Interface <small>(Beta 0.4.4)</small></h2>
    <hr />
    <p> <a href="index.jsp" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-home"></span> Home</a> </p>
    <hr />
    <div class="panel panel-primary">
      <div class="panel-heading"> Feature Update </div>
      <div class="panel-body">
        <form action="preview.jsp" name="form1" method="POST" class="form-horizontal" >
          <div class="form-group">
            <label for="endpoint" class="col-sm-2 control-label">SPARQL Endpoint</label>
            <div class="col-sm-10">
              <input type="text" id="endpoint" class="form-control" name="endpoint" value="<%=feature.getEndpoint()%>" />
            </div>
          </div>
          <div class="form-group">
            <label for="feature" class="col-sm-2 control-label">Feature Name</label>
            <div class="col-sm-10">
              <input type="text" id="feature" name="feature"  class="form-control" value="<%=feature.getName().replace(GlobalSettings.getFDAFeaturesNameSpace(), "")%>" readonly/>
            </div>
          </div>
          <div class="form-group">
            <label for="title" class="col-sm-2 control-label">Title</label>
            <div class="col-sm-10">
              <input type="text" id="title" name="title" class="form-control" value="<%=feature.getTitle()%>" />
            </div>
          </div>
          <div class="form-group">
            <label for="abstract" class="col-sm-2 control-label">Abstract</label>
            <div class="col-sm-10">
              <input type="text" id="abstract" name="abstract" class="form-control" value="<%=feature.getFeatureAbstract()%>" />
            </div>
          </div>
          <div class="form-group">
            <label for="keywords" class="col-sm-2 control-label">Key-words</label>
            <div class="col-sm-10">
              <input type="text" id="keywords" name="keywords" class="form-control" value="<%=feature.getKeywords()%>" />
            </div>
          </div>
          <div class="form-group">
            <label for="variable" class="col-sm-2 control-label">Geometry Variable</label>
            <div class="col-sm-10">
              <input type="text" id="variable" name="variable" class="form-control" value="<%="?"+feature.getGeometryVariable()%>" />
            </div>
          </div>
          <div class="form-group">
            <label for="query" class="col-sm-2 control-label">SPARQL Query</label>
            <div class="col-sm-10">
              <textarea id="query" name="query" class="form-control" rows="13"><%=feature.getQuery()%></textarea>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <p>* Feature name cannot be modified.</p>
              <input type="hidden" id="hiddenId" name="operation" value="edit" >
              <input type="submit" id="btnSave" name="update" value="Preview" class="btn btn-success"/>
            </div>
          </div>
        </form>
      </div>
    </div>
     <hr />
     </div>
</div>
<%
		
/* 		if(request.getParameter("update")!=null){
			
			
			Facade.getInstance().addFeature
			out.println("Changes saved.");	
			
			
		} */
		
		%>
<%-- 				<% 
				
				if(request.getParameter("update")!=null){
					
					
					out.println("Changes at '" + feature.getName() + "' saved. ");

				} else {
									
		 	        Query query = QueryFactory.create(request.getParameter("query"));
		 	        ARQ.getContext().setTrue(ARQ.useSAX); 	       	        
		 	                     
		 	        if(!query.hasLimit()){
		 	        	query.setLimit(10);
		 	        			 	        	
		 	        } else if (query.getLimit()>10){
		 	        	query.setLimit(10);
		 	        }
		 	        
		 	       out.println("* Limited to the first 10 records.");
		 	        
		 	        
		 	        //QueryExecution qexec = QueryExecutionFactory.sparqlService(request.getParameter("endpoint"), query);
		 	        //ResultSet results = qexec.execSelect();
	 	        	 	       
		 	        ResultSet results = Facade.getInstance().executeQuery(query.toString(), request.getParameter("endpoint"));
	 				        
		 			%> 
		 			<table border="1">
		 				<tr>
		 			<% 
		 			
		 			for (int i = 0; i < query.getresultvars().size(); i++) {	
	
		 				out.println("<td><b>"+query.getResultVars().get(i).toString()+"</b></td>");
			 			
		 			}
		 			%> 
			 			</tr>
			 		<%
		 	        while (results.hasNext()) {
		 	            
		 	        	QuerySolution soln = results.nextSolution();
		 	        	
		 	 			%> 
		 	 			<tr>
		 	 			<% 
		 	    		for (int i = 0; i < query.getresultvars().size(); i++) {	
	
		 	    			out.println("<td>"+soln.get("?" + query.getResultVars().get(i).toString())+"</td>"); 	    			
		 	    		}
		 	 			%> 
		 	 			</tr>
		 	 			<%  	           
		 	        }
		 			%> 
		 			</table>
		 			<%		 				 	         	        
	
		 		}
	
		
 		%>
 		
 	 --%>
</body>
</html>