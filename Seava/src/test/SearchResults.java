package test;

import java.util.ArrayList;


public class SearchResults 
{
	private ArrayList results = new ArrayList();
	private int startindex;
	private int minpage;
	private int maxpage;
	private int hasnext;
	
	
	public int getHasnext()
	{
		return hasnext;
	}
	
	public void setHasnext(int hasnext)
	{
		this.hasnext = hasnext;
	}
	
	public int getMaxpage()
	{
		return maxpage;
	}
	
	public void setMaxpage(int maxpage)
	{
		this.maxpage = maxpage;
	}
	
	public int getMinpage()
	{
		return minpage;
	}
	
	public void setMinpage(int minpage)
	{
		this.minpage = minpage;
	}
	
	public int getStartindex()
	{
		return startindex;
	}
	
	public void setStartindex(int startindex)
	{
		this.startindex = startindex;
	}
	
	public ArrayList getResults()
	{
		return results;
	}
	
	public void setResults(ArrayList results)
	{
		this.results = results;
	}
}
