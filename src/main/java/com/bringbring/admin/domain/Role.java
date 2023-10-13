package com.bringbring.admin.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Role {
    private int roleNo;
    private int userNo;
    private int userGrade;
}
