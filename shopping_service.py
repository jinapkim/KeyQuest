from serpapi import GoogleSearch
import json
import sys


def shopping_search(term):

    print("running shopping service now")
    
    params = {"q": term, "tbm": "shop", "location": "Austin, Texas, United States", "hl": "en", "gl": "us",
              "api_key": "90948212eabaaefc0304a6e4976d60466bce8115d2dd544af93d1ac4eeb14695"}

    search = GoogleSearch(params)
    results = search.get_dict()
    print(results)
    if 'error' in results:
        print("ERROR", results['error'])
        return 0
    shopping_results = results['shopping_results']

    with open(term + " result.json", "w") as outfile:
        json.dump(shopping_results, outfile)
        
    return 1

if __name__ == "__main__":
    shopping_search(sys.argv[1])


