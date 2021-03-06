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

import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.Review;
import com.mycompany.myapp.dto.ReviewComment;

@Component
public class ReviewCommentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Integer insert(ReviewComment reviewComment, Member member){
		Integer pk = null;
		String sql = "insert into final_review_comments(review_comment_date,review_comment_content,members_member_id,reviews_review_no) values(now(),?,?,?) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql,new String[]{"review_comment_no"});
				pstmt.setString(1,reviewComment .getrCommentContent());
				pstmt.setString(2,member.getNick());
				pstmt.setInt(3, reviewComment.getReviewNo());
				
				return pstmt;
			}
		},keyHolder);
		
		Number keyNumber=keyHolder.getKey();
		pk=keyNumber.intValue();
		
		
		return pk;
	}
	
	public ReviewComment selectByPk(int reviewCommentNo){
		String sql="select * from final_review_comments where review_comment_no=? ";
		ReviewComment reviewComment = jdbcTemplate.queryForObject(sql, 
				new Object[]{reviewCommentNo},
				new RowMapper<ReviewComment>(){

					@Override
					public ReviewComment mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ReviewComment reviewComment=new ReviewComment();
						reviewComment.setrCommentNo(rs.getInt("review_comment_no"));
						reviewComment.setrCommentContent(rs.getString("review_comment_content"));
						reviewComment.setrCommentDate(rs.getDate("review_comment_date"));
						reviewComment.setMemberId(rs.getString("members_member_id"));
						reviewComment.setReviewNo(rs.getInt("reviews_review_no"));
						
						return reviewComment;
					}
				
			
		});
		return reviewComment;
	}
	
	
	public List<ReviewComment> selectByReviewNo(int reviewNo){
		System.out.println(reviewNo);
		String sql="";
		sql+="select * ";
		sql+="from final_review_comments ";
		sql+="where reviews_review_no = ? ";
		sql+="order by review_comment_no desc ";
		List<ReviewComment> list = jdbcTemplate.query(sql, new Object[]{ reviewNo },
				new RowMapper<ReviewComment>(){

					@Override
					public ReviewComment mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ReviewComment reviewComment=new ReviewComment();
						reviewComment.setrCommentNo(rs.getInt("review_comment_no"));
						reviewComment.setrCommentContent(rs.getString("review_comment_content"));
						reviewComment.setrCommentDate(rs.getDate("review_comment_date"));
						reviewComment.setMemberId(rs.getString("members_member_id"));
						
						return reviewComment;
					}
			
		});
	
		return list;
	}
	public int update(ReviewComment review) {
		String sql = "update reveiwcomments set review_comment_content=? review_comment_no=?";
		int rows = jdbcTemplate.update(
			sql,
			review.getrCommentContent(),
			
			review.getrCommentNo()
		);
		return rows; 
	}
	
	public int delete(int reviewCommentNo) {
		String sql = "delete from final_review_comments where review_comment_no=?";
		int rows = jdbcTemplate.update(sql,reviewCommentNo);
		return rows;
	}
}
