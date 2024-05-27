package com.gyub.WhereToDrive.common;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Search extends Pagination{

	private String searchType;
	private String keyword;

}