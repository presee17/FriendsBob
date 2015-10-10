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

import com.mycompany.myapp.dto.Partner;

@Component
public class PartnerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Integer insert(Partner partner) {
		Integer pk = null;
		String sql = "insert into final_partners(partner_name, partner_content, partner_location, partner_tel, partner_original_file_name, partner_filesystem_name, partner_content_type) values(?,?,?,?,?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "partner_no" });
				pstmt.setString(1, partner.getName());
				pstmt.setString(2, partner.getContent());
				pstmt.setString(3, partner.getLocation());
				pstmt.setString(4, partner.getTel());
				pstmt.setString(5, partner.getOriginalFileName());
				pstmt.setString(6, partner.getFilesystemName());
				pstmt.setString(7, partner.getContentType());
				return pstmt;
			}

		}, keyHolder);
		Number keyNumber = keyHolder.getKey();
		pk = keyNumber.intValue();
		return pk;
	}

	public int update(Partner partner) {
		String sql = "update final_partners set partner_name=?, partner_content=? where partner_no=?";
		int rows = jdbcTemplate.update(sql, partner.getName(), partner.getContent(), partner.getNo());
		return rows;
	}

	public int delete(int partnerNo) {
		String sql = "delete from final_partners where partner_no=?";
		int rows = jdbcTemplate.update(sql, partnerNo);
		return rows;
	}

	public List<Partner> selectByPage(int pageNo, int rowsPerPage, String kinds) {
		String sql = "";
		sql += "select partner_no, partner_name, partner_location, partner_kind ";
		sql += "from final_partners ";
		if(!kinds.equals("all")) {
			sql += "where partner_kind like ? ";
		}
		sql += "order by partner_no desc ";
		sql += "limit ?,?";

		Object[] values;
		if(kinds.equals("all")) {
			values = new Object[] { (pageNo - 1) * rowsPerPage, rowsPerPage };
		} else {
			values = new Object[] { "%"+kinds+"%", (pageNo - 1) * rowsPerPage, rowsPerPage };
		}
		
		List<Partner> list = jdbcTemplate.query(sql, values,
				new RowMapper<Partner>() {
					@Override
					public Partner mapRow(ResultSet rs, int rowNum) throws SQLException {
						Partner partner = new Partner();
						partner.setNo(rs.getInt("partner_no"));
						partner.setName(rs.getString("partner_name"));
						partner.setLocation(rs.getString("partner_location"));
						partner.setKind(rs.getString("partner_kind"));
						return partner;
					}
				});
		System.out.println(list.size());
		return list;
	}

	public Partner selectByPk(int partnerNo) {
		String sql = "select * from final_partners where partner_no=?";
		Partner partner = jdbcTemplate.queryForObject(sql, new Object[] { partnerNo }, new RowMapper<Partner>() {
			@Override
			public Partner mapRow(ResultSet rs, int rowNum) throws SQLException {
				Partner partner = new Partner();
				partner.setNo(rs.getInt("partner_no"));
				partner.setName(rs.getString("partner_name"));
				partner.setTel(rs.getString("partner_tel"));
				partner.setLocation(rs.getString("partner_location"));
				partner.setContent(rs.getString("partner_content"));
				partner.setOriginalFileName(rs.getString("partner_original_file_name"));
				partner.setFilesystemName(rs.getString("partner_filesystem_name"));
				partner.setContentType(rs.getString("partner_content_type"));
				return partner;
			}
		});
		return partner;
	}
	
	public int selectCount(){
		String sql="select count(*) from final_partners";
		int rows=jdbcTemplate.queryForObject(sql, Integer.class);
		return rows;
	}
}
