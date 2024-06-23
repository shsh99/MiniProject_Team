package com.exam.dto.upload;

import java.util.Arrays;

public class UploadDTO {

	int id;
    String fileName;
    byte[] fileData;
    
	public UploadDTO() {}

	public UploadDTO(int id, String fileName, byte[] fileData) {
		this.id = id;
		this.fileName = fileName;
		this.fileData = fileData;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getFileData() {
		return fileData;
	}

	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	@Override
	public String toString() {
		return "UploadDTO [id=" + id + ", fileName=" + fileName + ", fileData=" + Arrays.toString(fileData) + "]";
	}
    
}
