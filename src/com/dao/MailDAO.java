package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.dto.DTO;
import com.dto.MailDTO;
import com.util.DateUtil;
import com.util.MailComparator;

public class MailDAO extends DAO{
	//TODO:例外処理ががばがば
	//TODO:日付作ったらSQLのidを日付にする
	public ArrayList<MailDTO> selectWhereTo(String id) throws Exception{
		System.out.println("-------- Select where to = id");
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
		DateUtil du = new DateUtil();
		return this.executeUpdate(
				"insert into mail values(0, ?,?,?,?,?,?,?,false,false)",
				dto.getFrom(),
				dto.getFromName(),
				dto.getTo(),
				dto.getToName(),
				du.getDateYMDHMS(),
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

	public ArrayList<MailDTO> search(String...search) throws SQLException, Exception{
		String string = "%" + search[0] + "%";
		System.out.println(search[1]);
		ArrayList<DTO> list = this.executeQuery("select * from mail where title like ? and `to` = ?",
													(resultSet) -> getMailDTO(resultSet),
													string, search[1]
													).getList();
		ArrayList<DTO> list2 = this.executeQuery("select * from mail where text like ? and `to` = ?",
													(resultSet) -> getMailDTO(resultSet),
													string, search[1]
													).getList();
		List<DTO> list3 = new ArrayList<>();
		list3.addAll(list);
		list3.addAll(list2);

		Set<MailDTO> set = new HashSet<>();
		for(DTO dto: list3){
			set.add((MailDTO)dto);
		}

		ArrayList<MailDTO> retList = new ArrayList<>();
		retList.addAll(set);

		if(retList != null){
			//TODO:sort処理
			Collections.sort(retList, new MailComparator());
		}
		return retList;
	}

	private MailDTO getMailDTO(ResultSet resultSet) throws SQLException{
		MailDTO dto = new MailDTO();
		dto.setId(resultSet.getInt("id"));
		dto.setFrom(resultSet.getString("from"));
		dto.setFromName(resultSet.getString("fromName"));
		dto.setTo(resultSet.getString("to"));
		dto.setToName(resultSet.getString("toName"));
		dto.setSendDate(resultSet.getDate("sendDate"));
		dto.setTitle(resultSet.getString("title"));
		dto.setText(resultSet.getString("text"));
		dto.setStar(resultSet.getBoolean("star"));
		dto.setRead(resultSet.getBoolean("read"));
		return dto;
	}
}
