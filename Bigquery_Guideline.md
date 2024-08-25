# Bigquery Guideline

A large number of databases in Spider2 are stored in BigQuery, including many large databases that reach TB-level. If you want to use the BigQuery Web UI to view database details, please refer to the following guidelines.

Please note that after sign up an account, you can directly view 70% of the databases. However, for the remaining 30% of the databases (spider2-public-data), **you need to fill in your BigQuery account information in this [form](https://docs.google.com/forms/d/e/1FAIpQLSdrsJX-oDZDL0McIaF-0uypLeO2pYW4SX-qDeNSd88iYR_3Gg/viewform)**, and we will grant you permanent access within 12 hours.

## How to Sign up Bigquery Account and Create a Project

There is the official tutorial. link

ours
#### 1.



#### 2.



#### 3.



## How to find the database used in Spider2

if the database_name is `bigquery-public-data.new_york`, which means that we should use `bigquery-public-data` project

if the database_name is `bigquery-public-data.new_york`, which means that we should use `bigquery-public-data` project

You need to star these project follow this [tutorial](https://cloud.google.com/bigquery/docs/bigquery-web-ui#:~:text=Star%20a%20project,-You%20can%20star&text=If%20you%20have%20access%20to,that%20you%20want%20to%20star.).


Then you can check the Bigquery Schema in detail.


## How to get your own bigquery credential

There is the [official tutorial](https://developers.google.com/workspace/guides/create-credentials), carefully read it to see
how to create credentials for a service account.