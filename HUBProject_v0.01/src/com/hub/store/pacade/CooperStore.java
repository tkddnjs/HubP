package com.hub.store.pacade;

import java.util.List;

import com.hub.domain.Cooper;

public interface CooperStore {
	
	// 업체 등록
	int nextCooperId();
	int insertCooper(Cooper cooper);
	int insertCooperConn(Cooper cooper);
	
	// 업체 수정
	int updateCooper(Cooper cooper);
	
	// 업체 삭제
	int deleteCooper(int coId);
	int deleteCooperConn(int coId);
	
	// 업체 조회
	List<Cooper> selectAll();
	Cooper selectCooperByCoId(int coId);
	List<Cooper> selectCoopersByConnChain(String connChain);
}
