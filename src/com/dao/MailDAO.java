package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.dto.DTO;
import com.dto.MailDTO;

public class MailDAO extends DAO{
	//TODO:例外処理ががばがば
	//TODO:日付作ったらSQLのidを日付にする
	public ArrayList<MailDTO> selectWhereTo(String id) throws Exception{
		ArrayList<DTO> mailList = executeQuery("select * from mail where `to` = ? order by id desc",
										(resultSet) -> getMailDTO(resultSet),
										id
								).getList();
		ArrayList<MailDTO> resultList = new ArrayList<>();
		if(mailList == null)return resultList;
		for(DTO dto: mailList){
			resultList.add((MailDTO)dto);
		}
		return resultList;
	}

	public int insert(MailDTO dto) throws SQLException{
		//TODO:dateをいれる
		return this.executeUpdate(
				"insert into mail values(0, ?,?,?,?,?,?,?,false,false)",
				dto.getFrom(),
				dto.getFromName(),
				dto.getTo(),
				dto.getToName(),
//				dto.getSendDate(),
				null,
				dto.getTitle(),
				dto.getText()
		);
	}

	//既読にする
	public int updateRead(int id)throws SQLException{
		return this.executeUpdate("update mail set read = true where id = ?", String.valueOf(id));
	}

	//星をつけはずしする
	public int updateStar(int id)throws SQLException{
		return this.executeUpdate("update mail set star = if(star = 1, 0, 1) where id = ?", String.valueOf(id));
	}

	public int delete(int...id) throws SQLException{
		return this.executeUpdate("delete from mail where id = ?", id.toString());
	}

	private MailDTO getMailDTO(ResultSet resultSet) throws SQLException{
		MailDTO dto = new MailDTO();
		dto.setId(resultSet.getInt("id"));
		dto.setFrom(resultSet.getString("from"));
		dto.setFromName(resultSet.getString("fromName"));
		dto.setTo(resultSet.getString("to"));
		dto.setToName(resultSet.getString("toName"));
		//TODO:Dateの冠する項目をつくる
		dto.setSendDate(new Date());
		dto.setTitle(resultSet.getString("title"));
		dto.setText(resultSet.getString("text"));
		dto.setStar(resultSet.getBoolean("star"));
		dto.setRead(resultSet.getBoolean("read"));
		return dto;
	}
}
