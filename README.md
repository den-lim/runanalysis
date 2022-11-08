# runanalysis
Getting and Cleaning Data Week 4

The process:
1. Load the activity labels and features.
   Features will become the column names of the main data table.

2. Load the test data. Load the subject column, the activity column and the bulk data

3. Load the train data. Load the subject column, the activity column and the bulk data

4. Combine the test data tables into one test data table. Similarly, combine the train data tables into one train data table.

5. Add a test_type column before merging the two tables to state if the observation was a "test" data or "train" data. This step is unnecessary for the project requirements but would possibly help other queries.

6. Merged the two tables using rbind.

7. Replace the activity column with number 1-6 to the actual description -- walking, laying, etc.

8. Selecting specific columns of the data set into a subset containing the subject, activity, and means and stds.

9. Calculate the means of the value columns according to combinations of subject and activity.
