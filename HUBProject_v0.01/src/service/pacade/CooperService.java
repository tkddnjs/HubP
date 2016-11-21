package service.pacade;

import java.util.List;

import domain.Cooper;

public interface CooperService {

	int registerCooper(Cooper cooper);
	int modifyCooper(Cooper cooper);
	int removeCooper(int coId);
	List<Cooper> findAll();
	Cooper findCoopersByCoId(int coId);
}
