package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Meeting;

@Component
public class MeetingDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Integer insert(Meeting meeting) {
		Integer pk = null;
		String sql = "insert into final_meetings(meeting_title, meeting_name, meeting_content, meeting_date, meeting_recruit, meeting_total, members_member_id, meeting_address1, meeting_address2, meeting_food) values(?,?,?,now(),0,?,?,?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "meeting_no" });
				
				pstmt.setString(1, meeting.getTitle());
				pstmt.setString(2, meeting.getName());
				pstmt.setString(3, meeting.getContent());
				pstmt.setString(4, meeting.getTotal());
				pstmt.setString(5, meeting.getMemberId());
				pstmt.setString(6, meeting.getAddress1());
				pstmt.setString(7, meeting.getAddress2());
				pstmt.setString(8, meeting.getFood());
				return pstmt;
			}

		}, keyHolder);
		Number keyNumber = keyHolder.getKey();
		pk = keyNumber.intValue();
		return pk;
	}

	public int update(Meeting meeting) {
		String sql = "update final_meetings set meeting_title?, meeting_name=?, meeting_content=? where meeting_no=?";
		int rows = jdbcTemplate.update(sql, meeting.getTitle(), meeting.getName(), meeting.getContent(), meeting.getNo());
		return rows;
	}

	public int delete(int meetingNo) {
		String sql = "delete from final_meetings where meeting_no=?";
		int rows = jdbcTemplate.update(sql, meetingNo);
		return rows;
	}

	public List<Meeting> selectByPage(int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select meeting_no, meeting_title, meeting_food, members_member_id ";
		sql += "from final_meetings ";
		sql += "order by meeting_no desc ";
		sql += "list ?,?";

		List<Meeting> list = jdbcTemplate.query(sql, new Object[] { (pageNo - 1) * rowsPerPage, rowsPerPage },
				new RowMapper<Meeting>() {
					@Override
					public Meeting mapRow(ResultSet rs, int rowNum) throws SQLException {
						Meeting meeting = new Meeting();
						meeting.setNo(rs.getInt("meeting_no"));
						meeting.setTitle(rs.getString("meeting_title"));
						meeting.setFood(rs.getString("meeting_food"));
						meeting.setMemberId(rs.getString("members_member_id"));
						return meeting;
					}
				});
		return list;
	}
	
	public List<Meeting> selectByAddress(String address1, String address2) {
		String sql = "select * from final_meetings where meeting_address1=?, meeting_address2=?";
		List<Meeting> list = jdbcTemplate.query(sql, new Object[] { address1, address2 }, new RowMapper<Meeting>() {
			@Override
			public Meeting mapRow(ResultSet rs, int rowNum) throws SQLException {
				Meeting meeting = new Meeting();
				meeting.setNo(rs.getInt("meeting_no"));
				meeting.setTitle(rs.getString("meeting_title"));
				meeting.setName(rs.getString("meeting_name"));
				meeting.setDate(rs.getDate("meeting_date"));
				meeting.setRecruit(rs.getString("meeting_recruit"));
				meeting.setTotal(rs.getString("meeting_total"));
				meeting.setMemberId(rs.getString("members_member_id"));
				meeting.setAddress1(rs.getString("meeting_address1"));
				meeting.setAddress2(rs.getString("meeting_address2"));
				meeting.setFood(rs.getString("meeting_food"));
				meeting.setContent(rs.getString("meeting_content"));
				return meeting;
			}
		});
		return list;
	}
	
	public List<Meeting> selectByAddressForPage(int pageNo, int rowsPerPage, String address1, String address2) {
		String sql = "";
		sql += "select meeting_no, meeting_title, meeting_food, members_member_id ";
		sql += "from final_meetings ";
		sql += "where meeting_address1=? and meeting_address2=? ";
		sql += "order by meeting_no desc ";
		sql += "limit ?,?";

		List<Meeting> list = jdbcTemplate.query(sql, new Object[] {address1, address2, (pageNo - 1) * rowsPerPage, rowsPerPage},
				new RowMapper<Meeting>() {
					@Override
					public Meeting mapRow(ResultSet rs, int rowNum) throws SQLException {
						Meeting meeting = new Meeting();
						meeting.setNo(rs.getInt("meeting_no"));
						meeting.setTitle(rs.getString("meeting_title"));
						meeting.setFood(rs.getString("meeting_food"));
						meeting.setMemberId(rs.getString("members_member_id"));
						meeting.setAddress1(address1);
						meeting.setAddress2(address2);
						return meeting;
					}
				});
		return list;
	}

	public List<Meeting> selectByAddressForPage(int pageNo, int rowsPerPage, String address1, String address2, String search) {
		String sql = "";
		sql += "select meeting_no, meeting_title, meeting_food, members_member_id ";
		sql += "from final_meetings ";
		sql += "where meeting_address1=? and meeting_address2=? and meeting_title like '%?%' ";
		sql += "order by meeting_no desc ";
		sql += "limit ?,?";
		System.out.println(search);
		List<Meeting> list = jdbcTemplate.query(sql, new Object[] {address1, address2, search, (pageNo - 1) * rowsPerPage, rowsPerPage},
				new RowMapper<Meeting>() {
					@Override
					public Meeting mapRow(ResultSet rs, int rowNum) throws SQLException {
						Meeting meeting = new Meeting();
						meeting.setNo(rs.getInt("meeting_no"));
						meeting.setTitle(rs.getString("meeting_title"));
						meeting.setFood(rs.getString("meeting_food"));
						meeting.setMemberId(rs.getString("members_member_id"));
						meeting.setAddress1(address1);
						meeting.setAddress2(address2);
						return meeting;
					}
				});
		return list;
	}
	
	public Meeting selectByPk(int meetingNo) {
		String sql = "select * from final_meetings where meeting_no=?";
		Meeting meeting = jdbcTemplate.queryForObject(sql, new Object[] { meetingNo }, new RowMapper<Meeting>() {
			@Override
			public Meeting mapRow(ResultSet rs, int rowNum) throws SQLException {
				Meeting meeting = new Meeting();
				meeting.setNo(rs.getInt("meeting_no"));
				meeting.setTitle(rs.getString("meeting_title"));
				meeting.setName(rs.getString("meeting_name"));
				meeting.setDate(rs.getDate("meeting_date"));
				meeting.setRecruit(rs.getString("meeting_recruit"));
				meeting.setTotal(rs.getString("meeting_total"));
				meeting.setMemberId(rs.getString("members_member_id"));
				meeting.setAddress1(rs.getString("meeting_address1"));
				meeting.setAddress2(rs.getString("meeting_address2"));
				meeting.setFood(rs.getString("meeting_food"));
				meeting.setContent(rs.getString("meeting_content"));
				return meeting;
			}
		}); 
		return meeting;
	}
	
	public int selectCount(){
		String sql="select count(*) from final_meetings";
		int rows=jdbcTemplate.queryForObject(sql, Integer.class);
		return rows;
	}
}