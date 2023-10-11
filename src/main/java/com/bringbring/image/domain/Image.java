package com.bringbring.image.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Image {

	private int imageNo;
	private String tableName;
	private int imageGroupNo;
	private String imageName;
	private String imageRename;
	private String imagePath;
	
	public Image(String tableName, int imageGroupNo, String imageName, String imageRename, String imagePath) {
		super();
		this.tableName = tableName;
		this.imageGroupNo = imageGroupNo;
		this.imageName = imageName;
		this.imageRename = imageRename;
		this.imagePath = imagePath;
	}
	
	
}
