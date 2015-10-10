package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Member;

import org.springframework.stereotype.Component;

@Component
public class MemberDao {  

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public String insert(Member member) {  
		String sql = "insert into final_members values(?,?,?,?,?,0,0,0)";
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getAddress1());
				pstmt.setString(4, member.getAddress2());
				pstmt.setString(5, member.getNick());
				return pstmt;
			}
		});
		return member.getId();
	}

	public int update(Member member) {
		String sql = "update final_members set member_point=? where member_id=?";
		int rows = jdbcTemplate.update(sql, member.getPoint(), member.getId());
		return rows;
	}

	public Member selectById(String id) {
		String sql = "SELECT * FROM final_members WHERE member_id=?";
		List<Member> list = jdbcTemplate.query(sql, new Object[] { id }, new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member();
				member.setId(rs.getString("member_id"));
				member.setPassword(rs.getString("member_pwd"));
				member.setAddress1(rs.getString("member_address1"));
				member.setAddress2(rs.getString("member_address2"));
				member.setNick(rs.getString("member_nick"));
				member.setGrade(rs.getInt("member_grade"));
				member.setPoint(rs.getInt("member_point"));
				member.setRetire(rs.getString("member_retire"));
				return member;
			}
		});
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	public Member selectByName(String name) {
		String sql = "SELECT * FROM final_members WHERE member_name=?";
		List<Member> list = jdbcTemplate.query(sql, new Object[] { name }, new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member();
				member.setId(rs.getString("member_id"));
				member.setPassword(rs.getString("member_pwd"));
				member.setAddress1(rs.getString("member_address1"));
				member.setAddress2(rs.getString("member_address2"));
				member.setNick(rs.getString("member_nick"));
				member.setGrade(rs.getInt("member_grade"));
				member.setPoint(rs.getInt("member_point"));
				member.setRetire(rs.getString("member_retire"));
				return member;
			}
		});
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}
	
	public int delete(String id) {
		String sql = "delete from final_members where member_id=?";
		int rows = jdbcTemplate.update(sql, id);
		return rows;
	}

}