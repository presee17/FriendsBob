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
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.Review;

@Component
public class ReviewDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Integer insert(Review review, String memberId, int meetingNo){
		Integer pk=null;
		String sql="insert into final_reviews(review_title, review_content, review_date, review_grade, review_writer, review_meeting_no) values(?, ?, now(), ?, ?, ?) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator(){

			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"review_no"});
				pstmt.setString(1, review.getReviewTitle());
				pstmt.setString(2, review.getReviewContent());
				pstmt.setInt(3, review.getGrade());
				pstmt.setString(4, memberId);
				pstmt.setInt(5, meetingNo);
				
				return pstmt;
			}
			
		},keyHolder);
		Number keyNumber = keyHolder.getKey();
		pk=keyNumber.intValue();
		return pk;
	}
	
	public List<Review> selectByPage(int pageNo, int rowsPerPage){
		String sql = "";
		sql += "select review_no, review_title, review_writer, review_date ";
		sql += "from final_reviews ";
		sql += "order by review_no desc ";
		sql += "limit ?,? ";
		
		List<Review> list = jdbcTemplate.query(sql, 
				new Object[]{(pageNo-1)*rowsPerPage,rowsPerPage },
				new RowMapper<Review>(){

					@Override
					public Review mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Review review = new Review();
						review.setReviewNo(rs.getInt("review_no"));
						review.setReviewTitle(rs.getString("review_title"));
						review.setReviewWriter(rs.getString("review_writer"));
						review.setReviewDate(rs.getDate("review_date"));
						return review;
					}
				});
		return list;
	}
	
	public Review selectByPk(int reviewNo){
		String sql="select * from final_reviews where review_no=? ";
		Review review = jdbcTemplate.queryForObject(sql, 
				new Object[]{reviewNo},
				new RowMapper<Review>(){

					@Override
					public Review mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Review review = new Review();
						review.setReviewNo(rs.getInt("review_no"));
						review.setReviewContent(rs.getString("review_content"));
						review.setReviewTitle(rs.getString("review_title"));
						review.setReviewWriter(rs.getString("review_writer"));
						review.setReviewDate(rs.getDate("review_date"));
						review.setMeetingNo(rs.getInt("review_meeting_no"));
						return review;
					}
			
		});
		return review;
	}
	
	public String selectWriterByNo(int reviewNo){
		String sql="select review_writer from final_reviews where review_no=? ";
		Review review=jdbcTemplate.queryForObject(sql, 
				new Object[]{reviewNo},
				new RowMapper<Review>(){

					@Override
					public Review mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Review review=new Review();
						review.setReviewWriter(rs.getString("review_writer"));
						return review;
					}
			
		});
		
		return review.getReviewWriter();
	}
	
	public int update(Review review){
		String sql="update final_reviews set review_title=?, review_content=? where review_no=? ";
		int row = jdbcTemplate.update(sql,
				review.getReviewTitle(),
				review.getReviewContent(),
				review.getReviewNo());
		return row;
	}
	
	public int delete(int reviewNo){
		String sql="delete from final_reviews where review_no=? ";
		int row = jdbcTemplate.update(sql,reviewNo);
		return row;
		
	}
	
	public int selectCount() {
		String sql = "select count(*) from final_reviews";
		int rows = jdbcTemplate.queryForObject(sql, Integer.class);
		return rows;
	}
}
