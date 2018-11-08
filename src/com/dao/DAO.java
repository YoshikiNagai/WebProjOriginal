package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dto.DTO;
import com.util.DBConnector;

/**
 * ラムダ式用インターフェース
 * @author
 *
 */
interface SettingDTO{
	public abstract DTO run(ResultSet resultSet) throws SQLException;
}

/**
 * Data Access Object はすべてこのクラスを継承する
 *
 */
public abstract class DAO {
	private DBConnector dbConnector = new DBConnector();
	private Connection connection;

	private PreparedStatement commonPreparedStatement(String sql, String...setStrings) throws SQLException{
		connection = dbConnector.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		System.out.println("-------- Exec " + sql);

		for(int index = 0; index < setStrings.length; index++){
			preparedStatement.setString(index + 1, setStrings[index]);
		}
		return preparedStatement;
	}

	/**
	 *
	 * @param sql
	 * @param setStrings
	 * @return update実行件数
	 * @throws SQLException
	 */
	public int executeUpdate(String sql, String...setStrings) throws SQLException{
		System.out.println("-------- Execute update");
		int result = 0;
		try{
			PreparedStatement preparedStatement = commonPreparedStatement(sql, setStrings);
			result = preparedStatement.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return result;
	}

	/**
	 *
	 * @param sql
	 * @param settingDTO
	 * @param setStrings
	 * @return 取得したデータ
	 * @throws SQLException
	 */
	public VariableLengthDTO executeQuery(String sql, SettingDTO settingDTO, String...setStrings) throws SQLException{
		System.out.println("-------- Execute query");
		ArrayList<DTO> list = new ArrayList<>();
		try{
			PreparedStatement preparedStatement = commonPreparedStatement(sql, setStrings);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				list.add(settingDTO.run(resultSet));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			connection.close();
		}
		return new VariableLengthDTO(list);
	}
}

//TODO:使いたくないけど作っちゃった
/**
 * がばがばクラス
 * @author
 *
 */
class VariableLengthDTO{
	private ArrayList<DTO> list;
	private DTO dto;
	private boolean isMultiple;

	public VariableLengthDTO(ArrayList<DTO> list) {
		if(list.size() == 0){
			this.dto = null;
			this.isMultiple = false;
		}else if(list.size() == 1){
			this.isMultiple = false;
		}else{
			this.isMultiple = true;
		}
		if(!list.isEmpty())this.dto = list.get(0);
		this.list = list;
	}

	public VariableLengthDTO(DTO dto){
		this.dto = dto;
		this.isMultiple = false;
	}

	public DTO getSingle() throws Exception{
		if(this.isMultiple){
			throw new Exception("This object has multi element.");
		}
		return this.dto;
	}

	public ArrayList<DTO> getMulti() throws Exception{
		if(!this.isMultiple){
			throw new Exception("This object has single element.");
		}
		return this.list;
	}

	public ArrayList<DTO> getList() throws Exception{
		return this.list;
	}
}
