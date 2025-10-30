/*
  # Agricultural Market Intelligent System Database Schema

  ## Overview
  This migration creates the database structure for storing agricultural market data
  including crops, districts, prices, yield information, weather data, and recommendations.

  ## New Tables

  ### 1. `districts`
  Stores information about districts in Tamil Nadu
  - `id` (uuid, primary key)
  - `name` (text, unique) - District name
  - `vegetation_type` (text) - Primary vegetation type
  - `climate` (text) - Climate characteristics
  - `soil_type` (text) - Predominant soil type
  - `created_at` (timestamptz) - Record creation timestamp

  ### 2. `crops`
  Stores crop information
  - `id` (uuid, primary key)
  - `name` (text, unique) - Crop name
  - `category` (text) - Crop category (cereal, pulse, vegetable, etc.)
  - `growing_season` (text) - Primary growing season
  - `water_requirement` (text) - Water requirement level
  - `created_at` (timestamptz)

  ### 3. `district_crops`
  Links districts to crops they produce with yield and method data
  - `id` (uuid, primary key)
  - `district_id` (uuid, foreign key) - Reference to districts
  - `crop_id` (uuid, foreign key) - Reference to crops
  - `yield_per_hectare` (numeric) - Average yield in kg/hectare
  - `cultivation_method` (text) - How the crop is cultivated
  - `is_primary_crop` (boolean) - Whether this is a main crop for the district
  - `created_at` (timestamptz)

  ### 4. `market_prices`
  Tracks market prices for crops
  - `id` (uuid, primary key)
  - `crop_id` (uuid, foreign key) - Reference to crops
  - `district_id` (uuid, foreign key) - Reference to districts
  - `price_per_kg` (numeric) - Current price per kg
  - `price_date` (date) - Date of price record
  - `market_name` (text) - Name of the market
  - `created_at` (timestamptz)

  ### 5. `weather_data`
  Stores weather information for districts
  - `id` (uuid, primary key)
  - `district_id` (uuid, foreign key) - Reference to districts
  - `rainfall_mm` (numeric) - Rainfall in millimeters
  - `temperature_avg` (numeric) - Average temperature
  - `humidity_percent` (numeric) - Humidity percentage
  - `record_date` (date) - Date of weather record
  - `created_at` (timestamptz)

  ### 6. `recommendations`
  Stores AI-generated recommendations for districts
  - `id` (uuid, primary key)
  - `district_id` (uuid, foreign key) - Reference to districts
  - `crop_id` (uuid, foreign key) - Recommended crop
  - `recommendation_text` (text) - Detailed recommendation
  - `confidence_score` (numeric) - Confidence level (0-1)
  - `created_at` (timestamptz)

  ## Security
  - Enable RLS on all tables
  - Add policies for public read access (this is a public information system)
  - Only authenticated users can modify data

  ## Indexes
  - Add indexes on foreign keys for better query performance
  - Add indexes on commonly queried fields
*/

-- Create districts table
CREATE TABLE IF NOT EXISTS districts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text UNIQUE NOT NULL,
  vegetation_type text DEFAULT '',
  climate text DEFAULT '',
  soil_type text DEFAULT '',
  created_at timestamptz DEFAULT now()
);

-- Create crops table
CREATE TABLE IF NOT EXISTS crops (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text UNIQUE NOT NULL,
  category text DEFAULT '',
  growing_season text DEFAULT '',
  water_requirement text DEFAULT '',
  created_at timestamptz DEFAULT now()
);

-- Create district_crops junction table
CREATE TABLE IF NOT EXISTS district_crops (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  district_id uuid REFERENCES districts(id) ON DELETE CASCADE,
  crop_id uuid REFERENCES crops(id) ON DELETE CASCADE,
  yield_per_hectare numeric DEFAULT 0,
  cultivation_method text DEFAULT '',
  is_primary_crop boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  UNIQUE(district_id, crop_id)
);

-- Create market_prices table
CREATE TABLE IF NOT EXISTS market_prices (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  crop_id uuid REFERENCES crops(id) ON DELETE CASCADE,
  district_id uuid REFERENCES districts(id) ON DELETE CASCADE,
  price_per_kg numeric DEFAULT 0,
  price_date date DEFAULT CURRENT_DATE,
  market_name text DEFAULT '',
  created_at timestamptz DEFAULT now()
);

-- Create weather_data table
CREATE TABLE IF NOT EXISTS weather_data (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  district_id uuid REFERENCES districts(id) ON DELETE CASCADE,
  rainfall_mm numeric DEFAULT 0,
  temperature_avg numeric DEFAULT 0,
  humidity_percent numeric DEFAULT 0,
  record_date date DEFAULT CURRENT_DATE,
  created_at timestamptz DEFAULT now()
);

-- Create recommendations table
CREATE TABLE IF NOT EXISTS recommendations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  district_id uuid REFERENCES districts(id) ON DELETE CASCADE,
  crop_id uuid REFERENCES crops(id) ON DELETE CASCADE,
  recommendation_text text DEFAULT '',
  confidence_score numeric DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_district_crops_district ON district_crops(district_id);
CREATE INDEX IF NOT EXISTS idx_district_crops_crop ON district_crops(crop_id);
CREATE INDEX IF NOT EXISTS idx_market_prices_crop ON market_prices(crop_id);
CREATE INDEX IF NOT EXISTS idx_market_prices_district ON market_prices(district_id);
CREATE INDEX IF NOT EXISTS idx_weather_data_district ON weather_data(district_id);
CREATE INDEX IF NOT EXISTS idx_recommendations_district ON recommendations(district_id);

-- Enable Row Level Security
ALTER TABLE districts ENABLE ROW LEVEL SECURITY;
ALTER TABLE crops ENABLE ROW LEVEL SECURITY;
ALTER TABLE district_crops ENABLE ROW LEVEL SECURITY;
ALTER TABLE market_prices ENABLE ROW LEVEL SECURITY;
ALTER TABLE weather_data ENABLE ROW LEVEL SECURITY;
ALTER TABLE recommendations ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY "Public read access for districts"
  ON districts FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Public read access for crops"
  ON crops FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Public read access for district_crops"
  ON district_crops FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Public read access for market_prices"
  ON market_prices FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Public read access for weather_data"
  ON weather_data FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Public read access for recommendations"
  ON recommendations FOR SELECT
  TO anon
  USING (true);

-- Authenticated users can insert/update data
CREATE POLICY "Authenticated users can insert districts"
  ON districts FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can insert crops"
  ON crops FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can insert district_crops"
  ON district_crops FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can insert market_prices"
  ON market_prices FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can insert weather_data"
  ON weather_data FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can insert recommendations"
  ON recommendations FOR INSERT
  TO authenticated
  WITH CHECK (true);