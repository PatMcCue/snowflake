CREATE OR REPLACE TABLE garden_plants.veggies.VEGETABLE_DETAILS_PLANT_HEIGHT (
    plant_name STRING,
    UOM CHAR(1),
    Low_End_of_Range INTEGER,
    High_End_of_Range INTEGER
);

copy into VEGETABLE_DETAILS_PLANT_HEIGHT
from @util_db.public.like_a_window_into_an_s3_bucket/veg_plant_height.csv
file_format = (FORMAT_NAME = 'garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW' );

SELECT * FROM VEGETABLE_DETAILS_PLANT_HEIGHT;





