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

import com.mycompany.myapp.dto.Matjib;
import com.mycompany.myapp.dto.MatjibComment;
import com.mycompany.myapp.dto.Member;

@Component
public class MatjibCommentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Integer insert(MatjibComment matjibComment, Matjib matjib, Member member) {
		Integer pk = null;
		String sql = "insert into final_matjib_comments (matjibs_matjib_no, matjib_comment_content, matjib_comment_date, members_member_id) value (?,?,now(),?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "matjib_comment_no" });
				pstmt.setInt(1, matjib.getNo());
				pstmt.setString(2, matjibComment.getContent());
				pstmt.setString(3, member.getId());
				return pstmt;
			}
		}, keyHolder);
		Number keyNumber = keyHolder.getKey();
		pk = keyNumber.intValue();
		return pk;
	}


	public List<MatjibComment> selectByMatjibNo(int matjibNo) {

		String sql = " ";
		sql += "select * ";
		sql += "from final_matjib_comments ";
		sql += "where matjibs_matjib_no = ? ";
		sql += "order by matjib_comment_no dec ";
	

		List<MatjibComment> list = jdbcTemplate.query(sql, new Object[] {matjibNo },
				new RowMapper<MatjibComment>() {
					@Override
					public MatjibComment mapRow(ResultSet rs, int rowNum) throws SQLException {
						MatjibComment matjibComment = new MatjibComment();
						matjibComment.setMatjibNo(rs.getInt("matjibs_matjib_no"));
						matjibComment.setNo(rs.getInt("matjib_comment_no"));
						//in comment function, content is needed to show in page
						matjibComment.setContent(rs.getString("matjib_comment_content"));
						matjibComment.setDate(rs.getDate("matjib_comment_date"));
						matjibComment.setId(rs.getString("members_member_id"));
						return matjibComment;
					}
				});
		return list;
	}
	
	public MatjibComment selectByPk(int matjibCommentNo) {
		String sql = "select * from final_matjibs where matjib_no=?";
		MatjibComment matjibComment = jdbcTemplate.queryForObject(sql, new Object[] { matjibCommentNo }, new RowMapper<MatjibComment>() {
			@Override
			public MatjibComment mapRow(ResultSet rs, int rowNum) throws SQLException {
				MatjibComment matjibComment = new MatjibComment();
				matjibComment.setMatjibNo(rs.getInt("matjibs_matjib_no"));
				matjibComment.setNo(rs.getInt("matjib_comment_no"));
				//in comment function, content is needed to show in page
				matjibComment.setContent(rs.getString("matjib_comment_content"));
				matjibComment.setDate(rs.getDate("matjib_comment_date"));
				matjibComment.setId(rs.getString("members_member_id"));
				return matjibComment;
			}
		});
		return matjibComment;
	}
	
	

	public int update(MatjibComment matjibComment) {
		String sql = "update final_matjib_comments set matjib_comment_content=? where matjib_comment_no=? ";
		int rows = jdbcTemplate.update(sql, 
				matjibComment.getContent(),
				matjibComment.getNo());
		return rows;
	}
	
	public int delete(int matjibCommentNo) {
		String sql = "delete from final_matjib_comments where matjib_comment_no=? ";
		int rows = jdbcTemplate.update(
				sql,
				matjibCommentNo);
		return rows;
	}
	
	public int selectCount() {
		String sql = "select count (*) from final_matjib_comments ";
		int rows = jdbcTemplate.queryForObject(sql, Integer.class);
		return rows;
	}
}
