package com.mycompany.metamong.enums;

public enum SchemaEnum {
	MAIN("USER_2024_OTI_FINAL_TEAM1"),
	SUB1("USER_2024_OTI_FINAL_TEAM1_1"),
	SUB2("USER_2024_OTI_FINAL_TEAM1_2"),
	SUB3("USER_2024_OTI_FINAL_TEAM1_3");
	
    private final String schemaName;

    SchemaEnum(String schemaName) {
        this.schemaName = schemaName;
    }

    public String getSchemaName() {
        return schemaName;
    }
}
