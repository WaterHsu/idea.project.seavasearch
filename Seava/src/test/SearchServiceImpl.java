package test;


import java.util.ArrayList;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.*;


import test.SearchResults;
import test.SearchRequest;
import test.SearchResult;
import test.SearchService;
import test.SearchResultDao;






public class SearchServiceImpl implements SearchService
{
	private static final String PRODUCT_ID = "productid";
	private static final String INDEX_TIME = "indextime";
	private static final String PRODUCT_URL = "producturl";
	private static final String CATEGORY = "category";
	private static final String PRODUCT_NAME = "name";
	private static final String PRODUCT_TYPE = "type";
	private static final String SUMMARY = "summary";
//	private static final String INDEX_STORE_PATH = "G:\\seavaproject\\index";
	private static final String INDEX_STORE_PATH = "lucene\\index";
	private SearchResultDao searchResultDao;
	
	
	public SearchResults getSearchResults(SearchRequest request)
	{
		SearchResults results = new SearchResults();
		Query query = makeQuery(request.getQuery());
		ArrayList list = new ArrayList();
		
		try
		{
			IndexSearcher searcher = new IndexSearcher(INDEX_STORE_PATH);
			Hits hits = searcher.search(query);
			int length = hits.length();
			int startindex = request.getStartindex();
			int endindex;
			
			if(startindex > length)
			{
				
			}
			else
			{
				endindex = startindex + 9;
				
				if(endindex >= length)
				{
					endindex = length;
				}
				
				for(int i = startindex; i <= endindex; i++)
				{
					Document doc = hits.doc(i - 1);
					String id = doc.get("productid");
					list.add(id);
				}
			}
			
			results.setResults(list);
			
			int startpage;
			int endpage;
			
			if(startindex % 100 == 0)
			{
				startpage = (startindex / 100 - 1) * 10 + 1;
			}
			else
			{
				startpage = (startindex / 100) * 10 + 1;
			}
			
			int span;
			int hasnext;
			float temp = ((float) (length - (startpage - 1) * 10)) / 10;
			
			if(temp > 10)
			{
				span = 9;
				hasnext = 1;
			}
			else if(temp == 10)
			{
				span = 9;
				hasnext = 0;
			}
			else
			{
				hasnext = 0;
				
				if((int)temp < temp)
				{
					span = (int)temp;
				}
				else
				{
					span = (int)temp - 1;
				}
			}
			
			
			endpage = startpage + span;
			
			results.setMinpage(startpage);
			results.setMaxpage(endpage);
			results.setHasnext(hasnext);
			results.setStartindex(startindex);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return results;
	}
	
	public SearchResult getSearchResultById(int id)
	{
		return searchResultDao.getSearchResultById(id);
	}
	
	public SearchResultDao getSearchResultDao()
	{
		return searchResultDao;
	}
	
	public void setSearchResultDao(SearchResultDao searchResultDao)
	{
		this.searchResultDao = searchResultDao;
	}
	
	
	private Query makeQuery(String query)
	{
		TermQuery qu = new TermQuery(new Term("all", query.toLowerCase()));
		
		return qu;
	}
}
