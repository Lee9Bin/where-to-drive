package com.gyub.WhereToDrive.member.vo;

import java.util.Date;

public class MemberVO {

    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberMail;
    private String memberAddr1;
    private String memberAddr2;
    private Date regDate;

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberPw() {
        return memberPw;
    }

    public void setMemberPw(String memberPw) {
        this.memberPw = memberPw;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberMail() {
        return memberMail;
    }

    public void setMemberMail(String memberMail) {
        this.memberMail = memberMail;
    }

    public String getMemberAddr1() {
        return memberAddr1;
    }

    public void setMemberAddr1(String memberAddr1) {
        this.memberAddr1 = memberAddr1;
    }

    public String getMemberAddr2() {
        return memberAddr2;
    }

    public void setMemberAddr2(String memberAddr2) {
        this.memberAddr2 = memberAddr2;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

}