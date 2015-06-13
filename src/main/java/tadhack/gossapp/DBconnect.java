package tadhack.gossapp;


     import com.mongodb.*;
     import java.net.UnknownHostException;

	
public class DBconnect
{
	final String HOST="localhost";
	final int PORT=27017;
	final String DBNAME="gossip";
	public static DBconnect instance;
	public Mongo connection;
	public DB database;

	private DBconnect() throws UnknownHostException
	{
		
		this.connection=new Mongo(this.HOST,this.PORT);
		this.database=this.connection.getDB(this.DBNAME);
			
	}
	
	public static DBconnect createInstance() throws UnknownHostException
	{
		if(DBconnect.instance==null)
		{
	
			DBconnect.instance=new DBconnect();
		}
		return DBconnect.instance;
	}
	
	public DBCollection getCollection(String name)
	{
	     return this.database.getCollection(name);
	}
		
}
	
	
	
	