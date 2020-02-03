package com.luv2code.enquiryapp;

import org.hibernate.dialect.PostgreSQL10Dialect;
import org.hibernate.dialect.function.SQLFunctionTemplate;
import org.hibernate.type.StandardBasicTypes;

public class MyCustomDialect extends PostgreSQL10Dialect {
	
	public MyCustomDialect() {
		super();
		/*
		 * this.registerFunction("group_concat", new
		 * SQLFunctionTemplate(StandardBasicTypes.STRING, "group_concat(?1)"));
		 */
		
		this.registerFunction("substring", new SQLFunctionTemplate(StandardBasicTypes.STRING, "substring(?1, ?2)") );
		this.registerFunction("commacat", new SQLFunctionTemplate(StandardBasicTypes.STRING, "commacat(?1, ?2)") );
		
		this.registerFunction("array_to_string", new SQLFunctionTemplate(StandardBasicTypes.STRING, "array_to_string(?1)"));
	
	}

}
