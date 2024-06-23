package com.exam.service.application_list;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.application_list.Application_listDTO;
import com.exam.dto.cart.CartDTO;
import com.exam.mapper.Application_listMapper;

@Service
public class Application_listServiceImpl implements Application_listService {

	Application_listMapper application_listMapper;
	
	public Application_listServiceImpl(Application_listMapper application_listMapper) {
		this.application_listMapper = application_listMapper;
	}

	@Override
	public int applicationAdd(Application_listDTO dto) {
		return application_listMapper.applicationAdd(dto);
	}

	@Override
	public List<Application_listDTO> applicationList(int id) {
		return application_listMapper.applicationList(id);
	}

	@Override
	public int deleteApplication(Application_listDTO dto) {
		return application_listMapper.deleteApplication(dto);
	}

	@Override
	public int deleteAllApplication(Application_listDTO dto) {
		return application_listMapper.deleteAllApplication(dto);
	}

	@Override
    public boolean isDuplicateItem(int us_id, int cs_id) {
        // 해당 사용자의 장바구니에 이미 동일 상품이 있는지 체크하는 로직
        List<Application_listDTO> applicationList = application_listMapper.applicationList(us_id);
        for (Application_listDTO applicationItem : applicationList) {
            if (applicationItem.getCs_id() == cs_id) {
                return true; // 동일 상품이 존재하면 true 반환
            }
        }
        return false; // 동일 상품이 없으면 false 반환
    }
	
}
