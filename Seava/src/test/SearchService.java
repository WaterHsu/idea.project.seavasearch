package test;

import test.SearchRequest;
import test.SearchResult;
import test.SearchResults;

public interface SearchService 
{
	public abstract SearchResults getSearchResults(SearchRequest request);
	
	public abstract SearchResult getSearchResultById(int id);
}
