# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "3fe1fe6c-bc24-494d-bb6e-a377e75e8706",
# META       "default_lakehouse_name": "poc_lakehouse",
# META       "default_lakehouse_workspace_id": "0dec1b85-1750-4636-9b5a-7a51186126c7",
# META       "known_lakehouses": [
# META         {
# META           "id": "3fe1fe6c-bc24-494d-bb6e-a377e75e8706"
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

df = spark.sql("SELECT * FROM poc_lakehouse.dbo.fact_call_center_agent_evaluation LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
