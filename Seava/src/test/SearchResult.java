package test;

public class SearchResult 
{
	private int id;
	private String abstractContent;
	private String content;
	private String imageUrl;
	private String url;
	private String name;
	private String indexCreateTime;
	private String type;
	private String category;
	
	
	
	public int getId()
	{
		return id;
	}
	
	public void setId(int id)
	{
		this.id = id;
	}
	
	
	public String getContent()
	{
		return content;
	}
	
	public void setContent(String content)
	{
		this.content = content;
	}
	
	public String getCategory()
	{
		return category;
	}
	
	public void setCategory(String category)
	{
		this.category = category;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getType()
	{
		return type;
	}
	
	public void setType(String type)
	{
		this.type = type;
	}
	
	
	public String getAbstractContent()
	{
		return abstractContent;
	}
	
	public void setAbstractContent(String abstractContent)
	{
		this.abstractContent = abstractContent;
	}
	
	public String getUrl()
	{
		return url;
	}
	
	public void setUrl(String url)
	{
		this.url = url;
	}
	
	public String getImageUrl()
	{
		return imageUrl;
	}
	
	public void setImageUrl(String imageUrl)
	{
		this.imageUrl = imageUrl;
	}
	
	public String getIndexCreateTime()
	{
		return indexCreateTime;
	}
	
	public void setIndexCreateTime(String indexCreateTime)
	{
		this.indexCreateTime = indexCreateTime;
	}
}
