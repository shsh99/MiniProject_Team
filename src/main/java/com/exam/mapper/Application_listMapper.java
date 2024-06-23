package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.application_list.Application_listDTO;


@Mapper
public interface Application_listMapper {
	
	public int applicationAdd( Application_listDTO dto);
	public List<Application_listDTO> applicationList(int id);
	public int deleteApplication(Application_listDTO dto);
	public int deleteAllApplication(Application_listDTO dto);

}
