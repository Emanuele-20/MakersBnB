-- Add column for range of dates listing is available
ALTER TABLE listing
ADD COLUMN availability DATERANGE;