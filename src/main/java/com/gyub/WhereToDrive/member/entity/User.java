package com.gyub.WhereToDrive.member.entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String id;
    private String password;
    private String memberName;
    private String memberMail;
    private String memberAddr1;
    private String memberAddr2;
    private Date regDate;
}