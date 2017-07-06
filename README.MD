# How to start:

1. Run MySQL Server with required database.

2. To start application run following commands:
    - gulp
    - node "./build/index.js"

3. Send post request to the 'api/companies/list' route with following json body:
{
	"Name": "Пиво",
	"DishTypeIds": [1,2,3],
	"MinRate": 3,
	"Skip": 0,
	"Amount": 5,
	"Sorting": [
		{
			"Field": "Rate",
			"Direction": "DESC" 
		},
		{
			"Field": "Name",
			"Direction": "ASC" 
		}
	]
}

4. Or use link to the exported Postman test:
https://www.getpostman.com/collections/d7c17701cfaefd46a274