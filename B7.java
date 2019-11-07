import org.bson.*;
import org.json.simple.JSONValue;
import org.json.simple.JSONObject;

public class B7
{
	public static void main(String[] args) 
	{
		JSONObject obj = new JSONObject();
		obj.put("name","geet");
		obj.put("age",new Integer(20));
		obj.put("passing",new Double(2021));
		Document doc = Document.parse(obj.toString());

		Object obj1 = JSONValue.parse(obj.toString());
		JSONObject jso = (JSONObject) obj1;

		String name = (String) jso.get("name");
		long age = (Long) jso.get("age");
		double passing = (double) jso.get("passing");
		System.out.println("Name : "+name+"\nPassing out :  "+passing+"\nAge :  "+age);  

	}
}