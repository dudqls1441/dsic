package dev.mvc.members;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public List<String> selectId(Map<String, Object> map) {
	    List<String> list= this.memberDao.selectId(map);

	    return list;

	}

	@Override
	public int checkId(String id) {
		int cnt = this.memberDao.checkId(id);
		return 0;
	}

}
