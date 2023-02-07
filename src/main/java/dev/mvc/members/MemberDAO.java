package dev.mvc.members;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<String> selectId() {
		  return this.sqlSessionTemplate.selectList("members.selectId");
		}
	
	public int checkId(String id) {
		  return this.sqlSessionTemplate.selectOne("members.checkId", id);
		}

}
