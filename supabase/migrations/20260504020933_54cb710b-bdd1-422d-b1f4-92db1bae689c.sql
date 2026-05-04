
-- Insert categories
INSERT INTO public.categories (id, title, image_url, active, featured) VALUES
('11111111-1111-1111-1111-111111111101', 'Parathay (پراٹھے)', 'https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?w=600', true, true),
('11111111-1111-1111-1111-111111111102', 'Curry (سالن)', 'https://images.unsplash.com/photo-1631292784640-2b24be784d5d?w=600', true, true),
('11111111-1111-1111-1111-111111111103', 'Rice (چاول)', 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=600', true, true),
('11111111-1111-1111-1111-111111111104', 'Breakfast (ناشتہ)', 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?w=600', true, true),
('11111111-1111-1111-1111-111111111105', 'Tea & Drinks (چائے)', 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=600', true, true);

-- Parathay
INSERT INTO public.foods (title, description, price, image_url, category_id, featured, rating, badge) VALUES
('Plain Paratha (سادہ پراٹھا)', 'Freshly made plain paratha', 60, 'https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?w=600', '11111111-1111-1111-1111-111111111101', true, 4.6, 'Popular'),
('Lacha Paratha (لچھا پراٹھا)', 'Crispy multi-layered paratha', 100, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600', '11111111-1111-1111-1111-111111111101', false, 4.7, NULL),
('Meetha Paratha (میٹھا پراٹھا)', 'Sweet paratha with sugar', 100, 'https://images.unsplash.com/photo-1621241441637-ea2d3f59db32?w=600', '11111111-1111-1111-1111-111111111101', false, 4.5, NULL),
('Aloo Paratha (آلو پراٹھا)', 'Stuffed potato paratha', 150, 'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?w=600', '11111111-1111-1111-1111-111111111101', true, 4.8, 'Bestseller'),
('Qeema Paratha (قیمہ پراٹھا)', 'Stuffed minced meat paratha', 200, 'https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=600', '11111111-1111-1111-1111-111111111101', true, 4.7, NULL),
('Aloo Cheese Paratha (آلو چیز پراٹھا)', 'Potato and cheese stuffed paratha', 230, 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=600', '11111111-1111-1111-1111-111111111101', false, 4.6, 'New'),
('Qeema Cheese Paratha (قیمہ چیز پراٹھا)', 'Minced meat with cheese paratha', 300, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600', '11111111-1111-1111-1111-111111111101', false, 4.7, NULL);

-- Curry
INSERT INTO public.foods (title, description, price, image_url, category_id, featured, rating, badge) VALUES
('Channay (چنے)', 'Traditional chickpea curry (per plate)', 200, 'https://images.unsplash.com/photo-1631292784640-2b24be784d5d?w=600', '11111111-1111-1111-1111-111111111102', true, 4.7, NULL),
('Chicken Channay (چکن چنے)', 'Chicken with chickpeas', 230, 'https://images.unsplash.com/photo-1604952564555-13b39e0a5fd9?w=600', '11111111-1111-1111-1111-111111111102', true, 4.8, 'Popular'),
('Chicken Karahi (چکن کڑاہی)', 'Spicy chicken karahi', 300, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=600', '11111111-1111-1111-1111-111111111102', true, 4.9, 'Bestseller'),
('Koftay Channay (کوفتے چنے)', 'Meatballs with chickpeas', 240, 'https://images.unsplash.com/photo-1631292784640-2b24be784d5d?w=600', '11111111-1111-1111-1111-111111111102', false, 4.6, NULL),
('Chicken Qorma (چکن قورمہ)', 'Rich and creamy chicken qorma', 320, 'https://images.unsplash.com/photo-1626500155675-37e22d83ddf0?w=600', '11111111-1111-1111-1111-111111111102', true, 4.9, 'Chef Special'),
('Sabzi Pakora (سبزی پکوڑہ)', 'Mixed vegetable pakora curry', 200, 'https://images.unsplash.com/photo-1606471191009-63994c53433b?w=600', '11111111-1111-1111-1111-111111111102', false, 4.5, NULL),
('Mix Sabzi (مکس سبزی)', 'Mixed vegetable curry', 200, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=600', '11111111-1111-1111-1111-111111111102', false, 4.4, NULL),
('Aloo Mutter (آلو مٹر)', 'Potato and peas curry', 220, 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=600', '11111111-1111-1111-1111-111111111102', false, 4.5, NULL),
('Baingan Bhartha (بینگن کا بھرتہ)', 'Smoky mashed eggplant', 220, 'https://images.unsplash.com/photo-1631292784640-2b24be784d5d?w=600', '11111111-1111-1111-1111-111111111102', false, 4.5, NULL),
('Cheesy Aloo Bhujia (چیزی آلو بھجیا)', 'Cheesy potato bhujia', 180, 'https://images.unsplash.com/photo-1631292784640-2b24be784d5d?w=600', '11111111-1111-1111-1111-111111111102', false, 4.4, NULL),
('Mix Daal (مکس دال)', 'Mixed lentils', 200, 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=600', '11111111-1111-1111-1111-111111111102', false, 4.6, NULL),
('Daal Maash (دال ماش)', 'Urad daal classic', 230, 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=600', '11111111-1111-1111-1111-111111111102', false, 4.6, NULL),
('Surkh Lobia (سرخ لوبیا)', 'Red kidney bean curry', 230, 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=600', '11111111-1111-1111-1111-111111111102', false, 4.5, NULL),
('Sabit Masoor (ثابت مسور)', 'Whole masoor lentil curry', 200, 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=600', '11111111-1111-1111-1111-111111111102', false, 4.4, NULL);

-- Rice
INSERT INTO public.foods (title, description, price, image_url, category_id, featured, rating, badge) VALUES
('Special Mutton Biryani (اسپیشل مٹن بریانی)', 'Aromatic mutton biryani', 280, 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=600', '11111111-1111-1111-1111-111111111103', true, 4.9, 'Chef Special'),
('Chicken Pulao (چکن پلاؤ)', 'Fragrant chicken pulao', 240, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=600', '11111111-1111-1111-1111-111111111103', true, 4.8, 'Bestseller'),
('Mash Pulao (ماش پلاؤ)', 'Lentil pulao', 180, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=600', '11111111-1111-1111-1111-111111111103', false, 4.5, NULL),
('Chana Pulao (چنا پلاؤ)', 'Chickpea pulao', 180, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=600', '11111111-1111-1111-1111-111111111103', false, 4.6, NULL),
('Boiled Rice (ابلے چاول)', 'Plain steamed rice', 160, 'https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6?w=600', '11111111-1111-1111-1111-111111111103', false, 4.3, NULL);

-- Breakfast / Eggs
INSERT INTO public.foods (title, description, price, image_url, category_id, featured, rating, badge) VALUES
('Plain Omelette (سادہ آملیٹ)', 'Classic plain omelette', 70, 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=600', '11111111-1111-1111-1111-111111111104', false, 4.5, NULL),
('Desi Omelette (دیسی آملیٹ)', 'Spicy desi-style omelette', 100, 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?w=600', '11111111-1111-1111-1111-111111111104', true, 4.7, 'Popular'),
('Fried / Half Fry Egg (فرائی / ہاف فرائی انڈا)', 'Fried egg or half fry', 60, 'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=600', '11111111-1111-1111-1111-111111111104', false, 4.4, NULL);

-- Tea & Drinks
INSERT INTO public.foods (title, description, price, image_url, category_id, featured, rating, badge) VALUES
('Chai / Kerk Chai (چائے / کڑک چائے)', 'Hot karak chai', 70, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=600', '11111111-1111-1111-1111-111111111105', true, 4.8, 'Popular'),
('Doodh Patti (دودھ پتی)', 'Creamy doodh patti', 90, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=600', '11111111-1111-1111-1111-111111111105', false, 4.7, NULL),
('Tandoor Wali Chai (تندور والی چائے)', 'Smoky tandoor chai', 100, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=600', '11111111-1111-1111-1111-111111111105', true, 4.8, 'Special'),
('Kashmiri Chai (کشمیری چائے)', 'Pink Kashmiri chai', 150, 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=600', '11111111-1111-1111-1111-111111111105', true, 4.7, NULL);
