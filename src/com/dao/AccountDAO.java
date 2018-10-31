package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.AccountDTO;

//TODO: つくれ
public class AccountDAO extends DAO{
	public AccountDTO selectWhereId(String id) throws Exception{
		return  (AccountDTO)executeQuery("select * from account where id = ?",
										(resultSet) -> getAccountDTO(resultSet),
										id
								).getSingle();
	}

	public int insert(AccountDTO dto) throws SQLException{
		//TODO:birthdayのおおもといじったらなおす
		return this.executeUpdate(
				"insert into account values(?, ?, ?, ?, ?, ?, ?)",
				dto.getId(),
				dto.getPassword(),
				dto.getFirstName(),
				dto.getLastName(),
				dto.getPhoneNumber(),
				dto.getBirthDay().toString(),
				dto.getGender()
		);
	}

	private AccountDTO getAccountDTO(ResultSet resultSet) throws SQLException{
		AccountDTO dto = new AccountDTO();
		dto.setId(resultSet.getString("id"));
		dto.setPassword(resultSet.getString("password"));
		dto.setFirstName(resultSet.getString("firstName"));
		dto.setLastName(resultSet.getString("lastName"));
		dto.setPhoneNumber(resultSet.getString("phoneNumber"));
		dto.setBirthDay(resultSet.getDate("birthDay"));
		dto.setGender(resultSet.getString("gender"));
		return dto;
	}
}
