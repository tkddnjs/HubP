package handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class BooleanToYnHandler implements TypeHandler<Object>{

	public static final String YES = "Y";
	public static final String NO = "N";
	
	@Override
	public void setParameter(PreparedStatement arg0, int arg1, Object arg2, JdbcType arg3) throws SQLException {
		if((Boolean)arg2){
			arg0.setString(arg1, YES);
		} else {
			arg0.setString(arg1, NO);
		}
		
	}
	
	@Override
	public Object getResult(ResultSet arg0, String arg1) throws SQLException {
		if(YES.equals(arg0.getString(arg1)))
			return Boolean.TRUE;
		else {
			return Boolean.FALSE;
		}
	}

	@Override
	public Object getResult(ResultSet arg0, int arg1) throws SQLException {
		return null;
	}

	@Override
	public Object getResult(CallableStatement arg0, int arg1) throws SQLException {
		return null;
	}


}
