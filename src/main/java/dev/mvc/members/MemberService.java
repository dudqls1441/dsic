package dev.mvc.members;

import java.util.List;
import java.util.Map;

public interface MemberService {

	List<String> selectId(Map<String, Object> map);
	int checkId(String id);

}
