--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,1,'artemAdmin','61141762c5789f0a4b6043b17e50806b'),(13,2,'artemCustomer','61141762c5789f0a4b6043b17e50806b'),(14,2,'testProfile','newPass1800'),(16,2,'testProfile2','b627724c5264acc803c03731faf947cd');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (12,'Artem','Admin','mr.artnov@mail.ru','375449836511',10000),(13,'Artem','Customer','artemcustomer@mail.ru','375446732981',1400),(14,'NameTest','SurnameTst','test@email','375446377',1000.5),(16,'Profile','ForTests','proffortest@mail.ru','375178869955',2200);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (79,74,12,0),(80,75,13,0),(81,76,12,0),(82,76,15,0),(83,76,20,0),(92,85,12,0),(93,86,12,0),(96,89,15,0),(97,89,17,0),(98,89,17,0),(100,91,12,0),(103,94,12,0),(104,95,12,0),(106,73,13,0),(109,99,17,0);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (73,13,'2022-02-06',500,1),(74,13,'2022-02-06',1300,1),(75,13,'2022-02-06',500,1),(76,13,'2022-02-06',2600,1),(85,13,'2022-02-07',0,0),(86,13,'2022-02-07',0,0),(89,13,'2022-02-07',3800,1),(91,13,'2022-02-07',1300,1),(94,13,'2022-02-07',1300,1),(95,13,'2022-02-07',1300,1),(96,13,'2022-02-07',500,1),(99,13,'2022-02-08',1500,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (12,'MacBook','Air M1',1300,'13.3\" 2560 x 1600 IPS, 60 Hz, non-touch, Apple M1 3200 MHz, 8 GB, SSD 256 GB, Mac OS,gray'),(13,'iPhone','SE 64GB',500,'Apple iOS, 4.7\" IPS screen (750x1334), Apple A13 Bionic, 3 GB RAM, 64 GB, 12 MP camera, 1820 mAh, 1 SIM'),(14,'iPhone ','12 128GB',700,'Apple iOS, 6.1\" OLED screen (1170x2532), Apple A14 Bionic, 4 GB RAM, 128 GB, 12 MP, 2815 mAh, 1 SIM'),(15,'iPad','Air Space Gray 128GB',800,'10.9\" IPS (2360x1640), iPadOS, Apple A14 Bionic, 4 GB RAM, 128 GB Flash, Gray'),(16,'iPad','Pro 128GB',1200,'11\" IPS (2388x1668), iPadOS, Apple M1, 8GB RAM, 128GB Flash, Gray'),(17,'Apple','iMac',1500,'23.5\" 4480 x 2520 IPS, Glossy, Non-Touch, Apple M1, 8 GB, SSD 256 GB, Mac OS, Silver'),(18,'Apple','Watch Series 7',650,'41mm, AMOLED screen, pedometer, heart rate monitor, operating time: 18 hours, case: aluminum, bracelet: fluoroelastomer'),(19,'iPhone','11 64GB',650,'Apple iOS, 6.1\" IPS screen (828x1792), Apple A13 Bionic, 4 GB RAM, 64 GB flash memory, 12 MP camera, 3046 mAh battery, 1 SIM'),(20,'iPhone','XR 64GB',500,'Apple iOS, 6.1\" IPS screen (828x1792), Apple A12 Bionic, 3 GB RAM, 64 GB, 12 MP , 2942 mAh, 1 SIM'),(21,'MacBook','Pro \"14\" M1',1700,'14.2\" 3024 x 1964 IPS, 120 Hz, Apple M1 Pro (8 cores), 16 GB, SSD 512 GB, Mac OS, cover color silver'),(22,'MacBook','Air M1',1300,'13.3\" 2560 x 1600 IPS, 60 Hz, non-touch, Apple M1 3200 MHz, 8 GB, SSD 256 GB, Mac OS,gray'),(23,'MacBook','Air M1',1300,'13.3\" 2560 x 1600 IPS, 60 Hz, non-touch, Apple M1 3200 MHz, 8 GB, SSD 256 GB, Mac OS,gray');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'customer'),(3,'unknown');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;