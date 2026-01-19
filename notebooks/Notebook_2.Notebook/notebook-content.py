# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "5140e695-a8ff-40ac-a183-c2a643970467",
# META       "default_lakehouse_name": "poc_lakehouse",
# META       "default_lakehouse_workspace_id": "0dec1b85-1750-4636-9b5a-7a51186126c7",
# META       "known_lakehouses": [
# META         {
# META           "id": "5140e695-a8ff-40ac-a183-c2a643970467"
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


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
