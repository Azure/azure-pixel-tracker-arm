## Next Steps

You have successfully deployed an instance of the solution within the Azure resource group noted above, in the Azure subscription you specified. The solution includes multiple Azure services (linked below) and requires following a few steps in the ***Starting the Solution*** section below.

The following links provide information on [monitoring](https://github.com/Azure/cortana-intelligence-personalized-offers-retail-2/blob/master/Automated%20Deployment%20Guide/Post%20Deployment%20Instructions.md#monitor-progress), [scaling](https://github.com/Azure/cortana-intelligence-personalized-offers-retail-2/blob/master/Automated%20Deployment%20Guide/Post%20Deployment%20Instructions.md#scaling) and [visualizing](https://github.com/Azure/cortana-intelligence-personalized-offers-retail-2/blob/master/Automated%20Deployment%20Guide/Post%20Deployment%20Instructions.md#visualization) the output of the deployed solution. Details for [stopping the solution](https://github.com/Azure/cortana-intelligence-personalized-offers-retail-2/blob/master/Automated%20Deployment%20Guide/Post%20Deployment%20Instructions.md#stopping) can also be found on the same page.

Detailed steps for creating this solution manually can be found [here](https://github.com/Azure/cortana-intelligence-personalized-offers-retail-2/blob/master/Manual%20Deployment%20Guide/README.md).

### Starting the Solution

***Starting the stream jobs***

1. [Click here]({Outputs.streamJobDeepLinkUrl1}) to go to the first stream job, this should open in a new tab (or right-click on the link and select "Open in New Tab").
	
	i. Click on the ***Start*** at the top of the over view blade. When prompted select **now** as the time to begin the job. You can now close this tab to return to this page.


# Configure the Java Program

1. Navigate to the Kudu Console for your Web App at ({Outputs.webAppManagementLinkUrl}))
1. Go to "Debug console", then select "CMD"
1. Navigate to "D:\home\site\wwwroot"
1. Upload "cortana-pixeltracker-server-1.0-SNAPSHOT.jar" and "web.config" from the resources folder to this location. Note, the provided file is zipped to reduce the size. You must first unzip it to extract the jar. 
1. Navigate to {(Outputs.webAppUrl)}/pixel.jpg?var1=test&var2=test2 to test the service. 

### Deployed Resources and Configuration

**Azure Event Hub [Total: 1, Throughput Units: 20, Partitions: 16, Consumer Groups: 1]**

[Azure Event Hub]({Outputs.eventHubDeepLinkUrl}) is used to ingest the data from the Personalized Offers solution (product clicks and offers made). 

		Namepace: {Outputs.serviceBusNamespace}
		
		Event Hub Name: {Outputs.eventHubName}
		Event Hub Connection String: {Outputs.eventHubConnectionString}
		
		Consumer Group 1: {Outputs.eventHubGroup1}

**Azure Data Lake Store [Total 1]**

[Azure Data Lake Store]({Outputs.dataLakeStoreDeepLinkUrl}) is used to store our raw data from the simulation. This represents the user clicks and the offers made to users by the personalized offers solution.
		
		Data Lake Store Account: {Outputs.adlStoreAccount}
		
**Azure Stream Analytics [Total: 1, Streaming Units: 1]**

Azure Stream Analytics is used to process the data from event hub and redirect the data to multiple outputs. The stream jobs listed below output raw data to Azure Data Lake Store and Aggregate data for updating Document DB. 

		Stream Job 1 Name: {Outputs.streamingJobName1}
		Stream Job 1 URL: {Outputs.streamJ1bDeepLinkUrl1}
		Stream Job 1 Streaming Units: 1
		Stream Job 1 Summary: Write the raw user clicks and offers made to users to Azure Data Lake Store.
	
### Pricing

Details on pricing for these services can be found [here](https://azure.microsoft.com/en-us/pricing)

For usage amounts and billing details for your subscription login to the [Azure Management Portal](https://portal.azure.com/)

### Resources
*  [Azure Storage](https://azure.microsoft.com/en-us/services/storage)
*  [Azure Event Hub](https://azure.microsoft.com/en-us/services/event-hubs/)
*  [Azure DocumentDB](https://azure.microsoft.com/en-us/azure/documentdb/)
*  [Azure Data Lake Store](https://azure.microsoft.com/en-us/services/data-lake-store/)
*  [Azure Redis Cache](https://azure.microsoft.com/en-us/services/cache/)
*  [Azure Machine Learning](https://azure.microsoft.com/en-us/services/machine-learning/)
*  [Azure Stream Analytics](https://azure.microsoft.com/en-us/services/stream-analytics/)
*  [Azure Functions](https://azure.microsoft.com/en-us/services/functions/)
*  [Azure App Service](https://azure.microsoft.com/en-us/services/app-service/)
	
