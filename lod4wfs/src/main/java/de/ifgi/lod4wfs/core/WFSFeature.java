package de.ifgi.lod4wfs.core;

/**
 * @author Jim Jones
 */

public class WFSFeature {

	private String name;
	private String title;
	private String keywords;
	private String featureAbstract;
	private String defaultCRS;
	private String lowerCorner;
	private String upperCorner;

	private String query;
	private String geometryVariable;
	private String endpoint;
	private String fileName;
	private String outputFormat;

	private int recordsLimit;
	private String fields;

	private String SOLRSorting;

	private boolean isSOLR = false;
	private boolean isFDA = false;
	private boolean isSDA = false;
	
	private String SOLRGeometryField;
	private String SOLRFilter;
	private String SOLRSpatialConstraint;

	public WFSFeature() {
		super();

	}


	public WFSFeature(String name, String title, String keywords,
			String featureAbstract, String defaultCRS, String lowerCorner,
			String upperCorner, String query, String geometryVariable,
			String endpoint, String fileName, String outputFormat,
			int recordsLimit, String fields, String sOLRSorting,
			String sOLRGeometryField, String sOLRFilter,
			String sOLRSpatialConstraint) {
		super();
		this.name = name;
		this.title = title;
		this.keywords = keywords;
		this.featureAbstract = featureAbstract;
		this.defaultCRS = defaultCRS;
		this.lowerCorner = lowerCorner;
		this.upperCorner = upperCorner;
		this.query = query;
		this.geometryVariable = geometryVariable;
		this.endpoint = endpoint;
		this.fileName = fileName;
		this.outputFormat = outputFormat;
		this.recordsLimit = recordsLimit;
		this.fields = fields;
		this.SOLRSorting = sOLRSorting;
		this.SOLRGeometryField = sOLRGeometryField;
		this.SOLRFilter = sOLRFilter;
		this.SOLRSpatialConstraint = sOLRSpatialConstraint;
		this.isFDA = false;
		this.isSDA = false;
		this.isSOLR = false;
		
	}













	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getFeatureAbstract() {
		return featureAbstract;
	}

	public void setFeatureAbstract(String featureAbstract) {
		this.featureAbstract = featureAbstract;
	}

	public String getCRS() {
		return defaultCRS;
	}

	public void setCRS(String defaultCRS) {
		this.defaultCRS = defaultCRS;
	}

	public String getLowerCorner() {
		return lowerCorner;
	}

	public void setLowerCorner(String lowerCorner) {
		this.lowerCorner = lowerCorner;
	}

	public String getUpperCorner() {
		return upperCorner;
	}

	public void setUpperCorner(String upperCorner) {
		this.upperCorner = upperCorner;
	}

	public boolean isFDAFeature() {
		return isFDA;
	}

	public boolean isSDAFeature() {
		return isSDA;
	}

	public boolean isSOLRFeature() {
		return isSOLR;
	}

	public void setAsSOLRFeature(boolean solr) {
		this.isSOLR = solr;
	}

	public void setAsFDAFeature(boolean fda) {
		this.isFDA = fda;
	}

	public void setAsSDAFeature(boolean sda) {
		this.isSDA = sda;
	}

	
	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getGeometryVariable() {
		return geometryVariable;
	}

	public void setGeometryVariable(String geometryVariable) {
		this.geometryVariable = geometryVariable;
	}

	public String getEndpoint() {
		return endpoint;
	}

	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOutputFormat() {
		return outputFormat;
	}

	public void setOutputFormat(String outputFormat) {
		this.outputFormat = outputFormat;
	}

	public String getSOLRGeometryField() {
		return SOLRGeometryField;
	}

	public void setSOLRGeometryField(String solrGeometryField) {
		this.SOLRGeometryField = solrGeometryField;
	}

	public String getSOLRSpatialConstraint() {
		return SOLRSpatialConstraint;
	}

	public void setSOLRSpatialConstraint(String solrGeometryConstraint) {
		this.SOLRSpatialConstraint = solrGeometryConstraint;
	}


	public int getLimit() {
		return recordsLimit;
	}


	public void setLimit(int limit) {
		this.recordsLimit = limit;
	}


	public String getSOLRSorting() {
		return SOLRSorting;
	}


	public void setSOLRSorting(String order) {
		this.SOLRSorting = order;
	}

	public String getFields() {
		return fields;
	}


	public void setFields(String fields) {
		this.fields = fields;
	}


	public String getSOLRFilter() {
		return SOLRFilter;
	}


	public void setSOLRFilter(String sOLRFilter) {
		SOLRFilter = sOLRFilter;
	}










}



