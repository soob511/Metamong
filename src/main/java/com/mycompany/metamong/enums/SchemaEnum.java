package com.mycompany.metamong.enums;

public enum SchemaEnum {
	MAIN("USER_2024_OTI_FINAL_TEAM1"),
	SRM("USER_2024_OTI_FINAL_TEAM1_1"),
	PMS("USER_2024_OTI_FINAL_TEAM1_2"),
	HR("USER_2024_OTI_FINAL_TEAM1_3");
	
    private final String schemaName;

    SchemaEnum(String schemaName) {
        this.schemaName = schemaName;
    }

    public String getSchemaName() {
        return schemaName;
    }
}
