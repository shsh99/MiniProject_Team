package com.exam.service.application_list;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.application_list.Application_listDTO;


@Service
public interface Application_listService {

	public int applicationAdd( Application_listDTO dto);
	public List<Application_listDTO> applicationList(int id);
	public int deleteApplication(Application_listDTO dto);
	public int deleteAllApplication(Application_listDTO dto);
	
	// 추가: 중복 상품 체크 메서드
    boolean isDuplicateItem(int us_id, int cs_id);
}
