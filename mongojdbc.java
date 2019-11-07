import java.util.*;
import com.mongodb.*;
import org.bson.Document;
import json.simple.*;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

class mongojdbc
{
	public static void main(String[] args) {
		JSONObject obj = new JSONObject();
		obj.put("name","geet");
		obj.put("roll",new Integer(1));
		JSONObject obj1 = new JSONObject();
		obj1.put("name","xyz");
		obj1.put("roll",new Integer(2));
		JSONArray arr = new JSONArray();
		arr.add(obj);
		arr.add(obj1);
		try
		{
			MongoClient mongo = new MongoClient("localhost",27017);
			MongoCredential credential;
			credential = MongoCredential.createCredential("dbms","user","password".toCharArray());
			System.out.println("Connected to the database successfully");
			MongoDatabase database = mongo.getDatabase("dbms");
			database.createCollection("students");
			System.out.println("Collection students created successfully");
			MongoCollection<Document> collection = database.getCollection("students");
      		System.out.println("Collection students selected successfully");
      		for(int i = 0;i<2;i++)
      		{
      			Document doc = Document.parse(arr[i].toString());
      			collection.inserOne(doc);
      		}
      		System.out.println("Inserted records successfully");
      		FindIterable<Document> docs = collection.find();
      		for(Document doc1 : docs)
      		{
      			System.out.println(doc1);
      		}
      		collection.updateMany(Filters.eq("id",2),Updates.set("name","ABC"));
      		System.out.println("Updated records successfully");
      		FindIterable<Document> docs = collection.find();
      		for(Document doc1 : docs)
      		{
      			System.out.println(doc1);
      		}
      		collection.deleteMany(Filter.eq("id",2));
      		System.out.println("Deleted record successfully");
      		FindIterable<Document> docs = collection.find();
      		for(Document doc1 : docs)
      		{
      			System.out.println(doc1);
      		}
      		mongo.close();
		}
		catch(Exception e)
		{
			System.out.println("Exception occurred");
		}

	}
}
