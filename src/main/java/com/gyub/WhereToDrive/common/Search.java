package com.gyub.WhereToDrive.common;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Search extends Pagination{

	private String key;
	private String word;

}