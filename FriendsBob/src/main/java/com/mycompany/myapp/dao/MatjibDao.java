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
import com.mycompany.myapp.dto.Member;

@Component
public class MatjibDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Integer insert(Matjib matjib, Member member) {
		Integer pk = null;
		String sql = "insert into final_matjibs (matjib_name, matjib_content, matjib_date, members_member_id, matjib_food, matjib_address) value (?,?,now(),?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "matjib_no" });
				pstmt.setString(1, matjib.getName());
				pstmt.setString(2, matjib.getContent());
				pstmt.setString(3, member.getId());
				pstmt.setString(4, matjib.getFood());
				pstmt.setString(5, matjib.getAddress());
				return pstmt;
			}
		}, keyHolder);
		Number keyNumber = keyHolder.getKey();
		pk = keyNumber.intValue();
		return pk;
	}

	public List<Matjib> selectByPage(int pageNo, int rowsPerPage) {

		String sql = " " ;
		sql += "select matjib_no, matjib_name, matjib_date, members_member_id, matjib_food, matjib_address, matjib_hitCount ";
		sql += "from final_matjibs ";
		sql += "order by matjib_no desc ";
		sql += "limit ?,? ";

		List<Matjib> list = jdbcTemplate.query(
				sql, 
				new Object[] { (pageNo - 1) * rowsPerPage, rowsPerPage },
				new RowMapper<Matjib>() {
					@Override
					public Matjib mapRow(ResultSet rs, int rowNum) throws SQLException {
						Matjib matjib = new Matjib();
						matjib.setNo(rs.getInt("matjib_no"));
						matjib.setName(rs.getString("matjib_name"));
						matjib.setDate(rs.getDate("matjib_date"));
						matjib.setId(rs.getString("members_member_id"));
						matjib.setFood(rs.getString("matjib_food"));
						matjib.setAddress(rs.getString("matjib_address"));
						matjib.setHitCount(rs.getInt("matjib_hitCount"));
						return matjib;
					}
				}
			);
		return list;
	}

	public Matjib selectByPk(int matjibNo) {
		String sql = "select * from final_matjibs where matjib_no=?";
		Matjib matjib = jdbcTemplate.queryForObject(sql, new Object[] { matjibNo }, new RowMapper<Matjib>() {
			@Override
			public Matjib mapRow(ResultSet rs, int rowNum) throws SQLException {
				Matjib matjib = new Matjib();
				matjib.setNo(rs.getInt("matjib_no"));
				matjib.setName(rs.getString("matjib_name"));
				matjib.setContent(rs.getString("matjib_content"));
				matjib.setDate(rs.getDate("matjib_date"));
				matjib.setId(rs.getString("members_member_id"));
				matjib.setFood(rs.getString("matjib_food"));
				matjib.setAddress(rs.getString("matjib_address"));
				matjib.setAddress(rs.getString("matjib_address"));
				return matjib;
			}
		});
		return matjib;
	}

	public int update(Matjib matjib) {
		String sql = "update final_matjibs set matjib_name=?, matjib_content=?, matjib_food, matjib_address ";
		int rows = jdbcTemplate.update(sql, matjib.getName(), matjib.getContent(), matjib.getFood(), matjib.getAddress());
		return rows;
	}
	
	public int delete(int matjibNo) {
		String sql = "delete from final_matjibs where matjib_no=? ";
		int rows = jdbcTemplate.update(
				sql,
				matjibNo);
		return rows;
	}
	
	public int selectCount () {
		String sql = "select count(*) from final_matjibs ";
		int rows = jdbcTemplate.queryForObject(sql, Integer.class);
		return rows;
	}
	
}
