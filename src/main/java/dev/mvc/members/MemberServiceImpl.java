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
	public List<String> selectId() {
	    List<String> list= this.memberDao.selectId();

	    return list;

	}

	@Override
	public int checkId(String id) {
		int cnt = this.memberDao.checkId(id);
		return cnt;
	}

	@Override
	public int create(Map<String, Object> map) {
		int cnt = this.memberDao.create(map);
		return cnt;
	}

	@Override
	public Map<String, Object> selectMember(String id) {
		Map<String, Object> map = this.memberDao.selectMember(id);
		return map;
	}
}
