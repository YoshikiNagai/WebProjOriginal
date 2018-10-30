package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.AccountDTO;
import com.etc.Gender;

//TODO: つくれ
public class AccountDAO extends DAO{
	public AccountDTO selectWhereId(String id) throws Exception{
		return  (AccountDTO)executeQuery("select * from account where id = ?",
										(resultSet) -> getAccountDTO(resultSet),
										id
								).getSingle();
	}

	public int insert(AccountDTO dto) throws SQLException{
		//TODO:birthdayのおおもといじったらなおす genderもほかなおしたらなおす
		return this.executeUpdate(
				"insert into account values(?, ?, ?, ?, ?, ?, ?)",
				dto.getId(),
				dto.getPassword(),
				dto.getFirstName(),
				dto.getLastName(),
				dto.getPhoneNumber(),
				dto.getBirthDay(),
				dto.getGender().toString()
		);
	}

	//TODO:genderが鬼門
	private AccountDTO getAccountDTO(ResultSet resultSet) throws SQLException{
		AccountDTO dto = new AccountDTO();
		dto.setId(resultSet.getString("id"));
		dto.setPassword(resultSet.getString("password"));
		dto.setFirstName(resultSet.getString("firstName"));
		dto.setLastName(resultSet.getString("lastName"));
		dto.setPhoneNumber(resultSet.getString("phoneNumber"));
		dto.setBirthDay(resultSet.getString("birthDay"));
		dto.setGender((Gender)resultSet.getObject("gender"));
		return dto;
	}
}
