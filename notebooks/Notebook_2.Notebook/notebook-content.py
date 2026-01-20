# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "b15d12ca-9efc-4685-9139-dda89bd3fb6d",
# META       "default_lakehouse_name": "brz_lakehouse",
# META       "default_lakehouse_workspace_id": "0690c66c-0e84-43af-a08c-0ad7e0e10f7c",
# META       "known_lakehouses": [
# META         {
# META           "id": "b15d12ca-9efc-4685-9139-dda89bd3fb6d"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC CREATE TABLE Fact_Call_Center_Agent_Evaluation
# MAGIC (
# MAGIC     ROW_FID                                   INT,
# MAGIC     Agent_ID                                  string
# MAGIC )

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.sql("SELECT * FROM fact_call_center_agent_evaluation LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
