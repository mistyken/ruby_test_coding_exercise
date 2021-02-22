# Ruby UI and API Test Exercise

## To Setup
Ruby 2.6.1
Bundler 2.2.11
```bash
bundle install
```
##Run UI Test
The UI Test launches a chrome browser and navigate to Google search. It then search for "Duck" or other specified search term. 
To verify, it looks for number of search results and check if specified keyword exist in the search headlines.
```bash
cucumber features/GoogleSearch.feature 
```

##Run API Test
The API Test sends a GET request to the posts data endpoint. It then checks http response status
and key attributes of the first returned item. It also conduct a schema check on the json response data.
```bash
rspec
```