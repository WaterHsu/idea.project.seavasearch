package test;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowCallbackHandler;

import test.SearchRequest;
import test.SearchResultDao;



public class SearchResultDaoImpl implements SearchResultDao
{
	private DataSource dataSource;
	
	public DataSource getDataSource()
	{
		return dataSource;
	}
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	public SearchResult getSearchResultById(int id)
	{
		final int id_db = id;
		final SearchResult sr = new SearchResult();
		JdbcTemplate template = new JdbcTemplate(dataSource);
		
		template.query("select * from product where id=?", 
						new PreparedStatementSetter()
						{
							public void setValues(PreparedStatement ps) throws SQLException
							{
								ps.setInt(1, id_db);
							}
						}, 
						new RowCallbackHandler()
						{
							public void processRow(ResultSet rs) throws SQLException
							{
								try
								{
									sr.setAbstractContent(rs.getString("abstractcontent"));
									sr.setContent(rs.getString("content"));
									sr.setImageUrl(rs.getString("imageurl"));
									sr.setUrl(rs.getString("url"));
									sr.setName(rs.getString("name"));
									sr.setType(rs.getString("type"));
									sr.setId(rs.getInt("id"));
									
									//SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									
								}catch(Exception e)
								{
									e.printStackTrace();
								}
							}
						});
		
		return sr;
	}
}
