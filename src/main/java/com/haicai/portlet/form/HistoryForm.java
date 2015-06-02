package com.haicai.portlet.form;

import java.io.Serializable;

/**
* Create HistoryForm for personal history page submit
*
* @author Jason
*
*/

public class HistoryForm implements Serializable{

     private static final long serialVersionUID = 1141872662934884102L;

     private String university;

     private String degree;  
     
     private String major;

     private String graduationTime;

     public String getUniversity() {
          return university;
     }

     public void setUniversity(String university) {
          this.university = university;
     }

     public String getDegree() {
          return degree;
     }

     public void setDegree(String degree) {
          this.degree = degree;
     } 

     public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getGraduationTime() {
          return graduationTime;
     }

     public void setGraduationTime(String graduationTime) {
          this.graduationTime = graduationTime;
     }

}