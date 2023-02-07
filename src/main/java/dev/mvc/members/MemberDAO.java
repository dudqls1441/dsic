package dev.mvc.members;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<String> selectId(Map<String, Object> map) {
		  return this.sqlSessionTemplate.selectList("members.selectId", map);
		}
	
	public int checkId(String id) {
		  return this.sqlSessionTemplate.selectOne("members.checkId", id);
		}

}
