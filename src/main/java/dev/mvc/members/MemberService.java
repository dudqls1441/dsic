package dev.mvc.members;

import java.util.List;

public interface MemberService {

	List<String> selectId();
	int checkId(String id);

}
