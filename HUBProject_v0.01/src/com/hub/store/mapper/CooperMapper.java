package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.Cooper;

public interface CooperMapper {
	
//	업체 등록
	int nextCooperId();
	int insertCooper(Cooper cooper);
	int insertCooperConn(@Param("coId")int coId, @Param("connChain")String connChain);
	
//	업체 수정
	int updateCooper(Cooper cooper);
	
//	업체 삭제
	int deleteCooper(int coId);
	int deleteCooperConn(int coId);
	
//	업체 조회
	List<Cooper> selectAll();
	Cooper selectCooperByCoId(int coId);
	List<Cooper> selectCoopersByConnChain(String connChain);
	
//	Cooper domain에 connChains를 mapping
	List<String> selectConnChainsByCoId(int coId);
}
