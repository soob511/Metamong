package com.mycompany.metamong.dto.member;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class JoinFormDto {
    @JsonProperty("MId")
    private String MId;

    @JsonProperty("MPassword")
    private String MPassword;

    @JsonProperty("MName")
    private String MName;

    @JsonProperty("teamId")
    private int teamId;

    @JsonProperty("MEmpId")
    private String MEmpId;

    @JsonProperty("MTel")
    private String MTel;

    @JsonProperty("MRole")
    private String MRole;
}
