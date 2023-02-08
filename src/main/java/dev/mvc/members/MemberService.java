package dev.mvc.members;

import java.util.List;
import java.util.Map;

public interface MemberService {

	List<String> selectId();
	int checkId(String id);
	int create(Map<String, Object> map);
	Map<String, Object> selectMember(String id);
	int checkLogin(Map<String, Object> map);
	
}
