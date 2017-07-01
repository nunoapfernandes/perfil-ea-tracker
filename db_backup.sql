-- MySQL dump 10.16  Distrib 10.1.24-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: trackdb
-- ------------------------------------------------------
-- Server version	10.1.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id_episode` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `imdb` varchar(45) DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `season_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id_episode`),
  KEY `fk_episode_season1_idx` (`season_id`),
  KEY `fk_episode_media1_idx` (`media_id`),
  CONSTRAINT `fk_episode_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id_media`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_episode_season1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id_season`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,1,'tt1480055',61,1,3),(2,2,'tt1668746',55,1,4),(3,3,'tt1829962',57,1,5),(4,4,'tt1829963',55,1,6),(5,5,'tt1829964',54,1,7),(6,6,'tt1837862',52,1,8),(7,7,'tt1837863',57,1,9),(8,8,'tt1837864',58,1,10),(9,9,'tt1851398',56,1,11),(10,10,'tt1851397',52,1,12),(11,1,'tt1971833',52,2,14),(12,2,'tt2069318',53,2,15),(13,3,'tt2070135',52,2,16),(14,4,'tt2069319',50,2,17),(15,5,'tt2074658',54,2,18),(16,6,'tt2085238',54,2,19),(17,7,'tt2085239',55,2,20),(18,8,'tt2085240',53,2,21),(19,9,'tt2084342',54,2,22),(20,10,'tt2112510',63,2,23),(21,1,'tt2178782',54,3,25),(22,2,'tt2178772',57,3,26),(23,3,'tt2178802',52,3,27),(24,4,'tt2178798',53,3,28),(25,5,'tt2178788',57,3,29),(26,6,'tt2178812',53,3,30),(27,7,'tt2178814',57,3,31),(28,8,'tt2178806',56,3,32),(29,9,'tt2178784',50,3,33),(30,10,'tt2178796',62,3,34),(31,1,'tt2816136',58,4,36),(32,2,'tt2832378',52,4,37),(33,3,'tt2972426',56,4,38),(34,4,'tt2972428',55,4,39),(35,5,'tt3060856',53,4,40),(36,6,'tt3060910',50,4,41),(37,7,'tt3060876',51,4,42),(38,8,'tt3060782',52,4,43),(39,9,'tt3060858',50,4,44),(40,10,'tt3060860',65,4,45),(41,1,'tt3658012',59,5,47),(42,2,'tt3846626',63,5,48),(43,3,'tt3866836',66,5,49),(44,4,'tt3866838',57,5,50),(45,5,'tt3866840',64,5,51),(46,6,'tt3866842',62,5,52),(47,7,'tt3866846',66,5,53),(48,8,'tt3866850',69,5,54),(49,9,'tt3866826',63,5,55),(50,10,'tt3866862',72,5,56),(51,1,'tt3658014',59,6,58),(52,2,'tt4077554',62,6,59),(53,3,'tt4131606',60,6,60),(54,4,'tt4283016',68,6,61),(55,5,'tt4283028',67,6,62),(56,6,'tt4283054',60,6,63),(57,7,'tt4283060',58,6,64),(58,8,'tt4283074',66,6,65),(59,9,'tt4283088',69,6,66),(60,10,'tt4283094',81,6,67),(61,1,'tt5654088',55,7,69),(62,2,'tt5655178',55,7,70),(63,3,'tt5775840',55,7,71),(64,4,'tt5775846',55,7,72),(65,5,'tt5775854',55,7,73),(66,6,'tt5775864',55,7,74),(67,7,'tt5775874',55,7,75);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'action'),(2,'adventure'),(3,'animation'),(4,'anime'),(5,'biography'),(6,'children'),(7,'comedy'),(8,'crime'),(9,'disaster'),(10,'documentary'),(11,'drama'),(12,'eastern'),(13,'family'),(14,'fan-film'),(15,'fantasy'),(16,'film-noir'),(17,'game-show'),(18,'history'),(19,'holiday'),(20,'home-and-garden'),(21,'horror'),(22,'indie'),(23,'mini-series'),(24,'music'),(25,'musical'),(26,'mystery'),(27,'news'),(28,'none'),(29,'reality'),(30,'road'),(31,'romance'),(32,'science-fiction'),(33,'short'),(34,'soap'),(35,'special-interest'),(36,'sporting-event'),(37,'sports'),(38,'suspense'),(39,'talk-show'),(40,'thriller'),(41,'tv-movie'),(42,'war'),(43,'western'),(44,'action'),(45,'adventure'),(46,'animation'),(47,'anime'),(48,'biography'),(49,'children'),(50,'comedy'),(51,'crime'),(52,'disaster'),(53,'documentary'),(54,'drama'),(55,'eastern'),(56,'family'),(57,'fan-film'),(58,'fantasy'),(59,'film-noir'),(60,'game-show'),(61,'history'),(62,'holiday'),(63,'home-and-garden'),(64,'horror'),(65,'indie'),(66,'mini-series'),(67,'music'),(68,'musical'),(69,'mystery'),(70,'news'),(71,'none'),(72,'reality'),(73,'road'),(74,'romance'),(75,'science-fiction'),(76,'short'),(77,'soap'),(78,'special-interest'),(79,'sporting-event'),(80,'sports'),(81,'suspense'),(82,'talk-show'),(83,'thriller'),(84,'tv-movie'),(85,'war'),(86,'western');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) DEFAULT NULL,
  `tmdb` varchar(45) DEFAULT NULL,
  `overview` varchar(5000) DEFAULT NULL,
  `rating_trakt` decimal(4,2) DEFAULT NULL,
  `released` date DEFAULT NULL,
  `image_path` varchar(75) DEFAULT NULL,
  `category` int(11) NOT NULL,
  `rating` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_media`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Game of Thrones','1399','Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and the icy horrors beyond.',9.37,'2011-04-16','/gwPSoYUHAKmdyVywgLpKKA4BjRr.jpg',2,NULL),(2,'Season 1','1399',NULL,9.16,'2011-04-18','/olJ6ivXxCMq3cfujo1IRw30OrsQ.jpg',3,NULL),(3,'Winter Is Coming','1399','Ned Stark, Lord of Winterfell learns that his mentor, Jon Arryn, has died and that King Robert is on his way north to offer Ned Arryn’s position as the King’s Hand. Across the Narrow Sea in Pentos, Viserys Targaryen plans to wed his sister Daenerys to the nomadic Dothraki warrior leader, Khal Drogo to forge an alliance to take the throne.',8.18,'2011-04-18',NULL,4,NULL),(4,'The Kingsroad','1399','Having agreed to become the King’s Hand, Ned leaves Winterfell with daughters Sansa and Arya, while Catelyn stays behind in Winterfell. Jon Snow heads north to join the brotherhood of the Night’s Watch. Tyrion decides to forego the trip south with his family, instead joining Jon in the entourage heading to the Wall. Viserys bides his time in hopes of winning back the throne, while Daenerys focuses her attention on learning how to please her new husband, Drogo.',8.18,'2011-04-25',NULL,4,NULL),(5,'Lord Snow','1399','Arriving at King’s Landing, Ned is shocked to learn of the Crown’s profligacy from his new advisors. At Castle Black, Jon Snow impresses Tyrion at the expense of greener recruits. Suspecting the Lannisters had a hand in Bran’s fall, Catelyn covertly follows her husband to King’s Landing, where she is intercepted by Petyr Baelish, a.k.a. “Littlefinger,” a shrewd longtime ally and brothel owner. Cersei and Jaime ponder the implications of Bran’s recovery; Arya studies swordsmanship. On the road to Vaes Dothrak, Daenerys finds herself at odds with Viserys.',8.12,'2011-05-02',NULL,4,NULL),(6,'Cripples, Bastards, and Broken Things','1399','Ned looks for clues to the death of his predecessor, and uncovers one of King Robert’s bastards. Robert and his guests witness a tournament honoring Ned. Jon takes measures to protect Sam from further abuse at Castle Black; a frustrated Viserys clashes with Daenerys in Vaes Dothrak; Sansa imagines her future as a queen, while Arya envisions a far different future. Catelyn rallies her husband’s allies to make a point, while Tyrion finds himself caught in the wrong place at the wrong time.',8.17,'2011-05-09',NULL,4,NULL),(7,'The Wolf and the Lion','1399','Incensed over news of Daenerys’ alliance with the Dothrakis, Robert orders a preemptive strike on the Targaryens that drives a wedge in his relationship with Ned. A captive Tyrion helps Catelyn, but receives a cold reception at the Eyrie from her sister, Jon Arryn’s widow Lysa. Sansa is charmed by the dashing Ser Loras Tyrell, a.k.a. the Knight of Flowers. Arya overhears a plot against her father.',8.19,'2011-05-16',NULL,4,NULL),(8,'A Golden Crown','1399','Reinstated as the Hand, Ned sits for the King while Robert is on a hunt. Ned issues a decree that could have long-term consequences throughout the Seven Kingdoms. At the Eyrie, Tyrion confesses to his \"crimes,\" and demands that Lysa give him a trial by combat. Joffrey apologizes to Sansa. Viserys receives his final payment for Daenerys from Drogo.',8.38,'2011-05-23',NULL,4,NULL),(9,'You Win or You Die','1399','Explaining that the future of the Lannisters is at stake, Tywin presses Jaime to “be the man you were meant to be” as they prepare for battle. Ned confronts Cersei about the secrets that killed Jon Arryn. With the fate of the missing Benjen very much on his mind, Jon takes his Night’s Watch vows, though not with the assignment he coveted. After Ser Jorah saves Daenerys from treachery, an enraged Drogo vows to lead the Dothraki where they’ve never gone before. An injured Robert takes pains to ensure an orderly transition at King’s Landing.',8.36,'2011-05-30',NULL,4,NULL),(10,'The Pointy End','1399','In the aftermath of Ned\'s capture, Syrio and Arya face off against Lannister guards, while Cersei manipulates Sansa to her own ends. Robb rallies his father\'s northern allies against Tywin Lannister and heads south to war. Tyrion forms an uneasy alliance with the hill tribes and reunites with his father. Jon lashes out at Ser Alliser Thorne and battles a mysterious attacker from beyond the Wall. Dany is forced to reconcile her desire to conquer Westeros with Drogo\'s savagery after the Dothraki raid a peaceful village.',8.21,'2011-06-06',NULL,4,NULL),(11,'Baelor','1399','With Sansa\'s life in danger, Ned makes a fateful decision. Catelyn brokers an unsavory deal with the slippery Walder Frey. Tyrion acquires a mistress and is forced by his father to fight on the front lines. Robb wins his first major victory and captures a prized prisoner. Jon is rewarded for his valor and discovers a dark secret about Maester Aemon. As Drogo\'s wound festers, Dany defies her bloodrider Qotho and puts her trust in the enslaved witch Mirri Maz Duur.',8.45,'2011-06-13',NULL,4,NULL),(12,'Fire and Blood','1399','As tragic news spreads across the Seven Kingdoms, Bran and Rickon share a prophetic dream, Catelyn interrogates Jamie about her son\'s fall, and Robb\'s destiny is forever changed. After a surprising decision by his father, Tyrion heads south. Arya assumes a new identity in an attempt to escape King\'s Landing, and Sansa is terrorized by Joffrey. At the Wall, Jon is forced to choose between the Night\'s Watch and the family he left behind. Across the sea, Dany pays a terrible price for her love, but finds new hope.',8.68,'2011-06-20',NULL,4,NULL),(13,'Season 2','1399',NULL,9.12,'2012-04-02','/5tuhCkqPOT20XPwwi9NhFnC1g9R.jpg',3,NULL),(14,'The North Remembers','1399','As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.',8.24,'2012-04-02',NULL,4,NULL),(15,'The Night Lands','1399','In the wake of a bloody purge in the capital, Tyrion chastens Cersei for alienating the king’s subjects.  On the road north, Arya shares a secret with Gendry, a Night’s Watch recruit.  With supplies dwindling, one of Dany’s scouts returns with news of their position.  After nine years as a Stark ward, Theon Greyjoy reunites with his father Balon, who wants to restore the ancient Kingdom of the Iron Islands.  Davos enlists Salladhor Saan, a pirate, to join forces with Stannis and Melisandre for a naval invasion of King’s Landing.',8.16,'2012-04-09',NULL,4,NULL),(16,'What is Dead May Never Die','1399','At the Red Keep, Tyrion plots three alliances through the promise of marriage.  Catelyn arrives in the Stormlands to forge an alliance of her own, but King Renly, his new wife Margaery, and her brother Loras Tyrell have other plans.  At Winterfell, Luwin tries to decipher Bran’s dreams.',8.19,'2012-04-16',NULL,4,NULL),(17,'Garden of Bones','1399','Joffrey punishes Sansa for Robb’s victories, and Tyrion scrambles to temper the king’s cruelty. Catelyn entreats Stannis and Renly to unite against the Lannisters. Dany and her khalasar arrive at the prosperous city of Qarth. Tyrion coerces a relative into being his eyes and ears. Arya and Gendry are taken to Harrenhal, where their lives are in the hands of Ser Gregor Clegane. Stannis orders Davos to smuggle Melisandre into a secret cove.',8.18,'2012-04-23',NULL,4,NULL),(18,'The Ghost of Harrenhal','1399','The Baratheon rivalry ends, driving Catelyn to flee and Littlefinger to act. At King’s Landing, Tyrion’s source alerts him to Joffrey’s defense plan - and a mysterious secret weapon. Theon sails to the Stony Shore to prove he’s worthy to be called Ironborn. At Harrenhal, Arya receives a promise from Jaqen H’ghar, one of the prisoners she saved from the Gold Cloaks. The Night’s Watch arrive at the Fist of the First Men, an ancient ringfort where they hope to stem the wildings\' advance.',8.19,'2012-04-30',NULL,4,NULL),(19,'The Old Gods and the New','1399','Theon completes his master stroke. In King\'s Landing, the Lannisters send Myrcella off to be married. Arya comes face to face with a surprise visitor. Dany vows to take what is hers. Robb and Catelyn receive crucial news. Qhorin gives Jon a chance to prove himself.',8.24,'2012-05-07',NULL,4,NULL),(20,'A Man Without Honor','1399','Jamie meets a distant relative. Daenerys receives an invitation to the House of the Undying. Theon leads a search party. Jon loses his way in the wilderness. Cersei counsels Sansa.',8.21,'2012-05-14',NULL,4,NULL),(21,'The Prince of Winterfell','1399','Theon receives a visitor. Arya asks her third and last death from Jaqen. While Stannis\' army is reaching its destination, Davos is offered a reward.  Betrayal befalls Robb.',8.14,'2012-05-21',NULL,4,NULL),(22,'Blackwater','1399','Tyrion and the Lannisters fight for their lives as Stannis’ fleet assaults King’s Landing.',8.60,'2012-05-28',NULL,4,NULL),(23,'Valar Morghulis','1399','Tyrion awakens to a changed situation. King Joffrey doles out rewards to his subjects. As Theon stirs his men to action, Luwin offers some final advice. Brienne silences Jaime. Arya receives a gift from Jaqen. Dany goes to a strange place. Jon proves himself to Qhorin.',8.57,'2012-06-04',NULL,4,NULL),(24,'Season 3','1399',NULL,9.20,'2013-04-01','/7d3vRgbmnrRQ39Qmzd66bQyY7Is.jpg',3,NULL),(25,'Valar Dohaeris','1399','Jon meets the King-Beyond-the-Wall while his Night Watch Brothers flee south. In King\'s Landing, Tyrion wants a reward, Margaery shows her charitable nature, Cersei arranges a dinner party, and Littlefinger offers to help Sansa. Across the Narrow Sea, Daenerys starts her journey west.',8.29,'2013-04-01',NULL,4,NULL),(26,'Dark Wings, Dark Words','1399','Sansa says too much. Shae asks Tyrion for a favor. Jaime finds a way to pass the time, while Arya encounters the Brotherhood Without Banners.',8.12,'2013-04-08',NULL,4,NULL),(27,'Walk of Punishment','1399','Tyrion shoulders new responsibilities. Jon is taken to the Fist of the First Men. Daenerys meets with the slavers. Jaime strikes a deal with his captors.',8.22,'2013-04-15',NULL,4,NULL),(28,'And Now His Watch Is Ended','1399','Trouble brews among the Night\'s Watch at Craster\'s. Margaery takes Joffrey out of his comfort zone. Arya meets the leader of the Brotherhood. Varys plots revenge on an old foe. Theon mournfully recalls his missteps. Daenerys deftly orchestrates her exit from Astapor.',8.67,'2013-04-22',NULL,4,NULL),(29,'Kissed by Fire','1399','The Hound is judged by the gods. Jaime is judged by men. Jon proves himself. Robb is betrayed. Tyrion learns the cost of weddings.',8.20,'2013-04-29',NULL,4,NULL),(30,'The Climb','1399','Tywin plans strategic unions for the Lannisters. Melisandre pays a visit to the Riverlands. Robb weighs a compromise to repair his alliance with House Frey. Roose Bolton decides what to do with Jaime Lannister. Jon, Ygritte, and the Wildlings face a daunting climb.',8.17,'2013-05-06',NULL,4,NULL),(31,'The Bear and the Maiden Fair','1399','Daenerys exchanges gifts with a slave lord outside of Yunkai. As Sansa frets about her prospects, Shae chafes at Tyrion’s new situation. Tywin counsels the king, and Melisandre reveals a secret to Gendry. Brienne faces a formidable foe in Harrenhal.',8.23,'2013-05-13',NULL,4,NULL),(32,'Second Sons','1399','King’s Landing hosts a wedding, and Tyrion and Sansa spend the night together. Daenerys meets the Titan’s Bastard. Davos demands proof from Melisandre. Sam and Gilly meet an older gentleman.',8.31,'2013-05-20',NULL,4,NULL),(33,'The Rains of Castamere','1399','Robb presents himself to Walder Frey, and Edmure meets his bride. Jon faces his harshest test yet. Bran discovers a new gift. Daario and Jorah debate how to take Yunkai. House Frey joins with House Tully.',8.82,'2013-06-03',NULL,4,NULL),(34,'Mhysa','1399','Joffrey challenges Tywin. Bran tells a ghost story. In Dragonstone, mercy comes from strange quarters. Daenerys waits to see if she is a conqueror or a liberator.',8.46,'2013-06-10',NULL,4,NULL),(35,'העונה הרביעית','1399',NULL,9.18,'2014-04-07','/dniQ7zw3mbLJkd1U0gdFEh4b24O.jpg',3,NULL),(36,'Two Swords','1399','Tyrion welcomes a surprise guest to King’s Landing for the royal wedding, but fears he’s come to the Red Keep for something else. Meanwhile, Jon warns his skeptical Night’s Watch superiors about an impending attack. Jaime struggles to regain his status at home. Arya encounters a face from her past, and Daario Naharis discusses strategy with Daenerys on the journey to the slave city Meereen.',8.45,'2014-04-07',NULL,4,NULL),(37,'The Lion and the Rose','1399','A who’s who of honored guests turns out for Joffrey and Margaery’s wedding in King’s Landing, but the king’s taste in entertainment rubs many of them the wrong way. Meanwhile, Bronn gives a lesson to an unlikely pupil; Bran’s vision helps map out his journey; Stannis loses patience with Davos; and Ramsay takes a perverse delight in his new pet.',8.80,'2014-04-14',NULL,4,NULL),(38,'Breaker of Chains','1399','In the frenzied aftermath of the royal wedding, Tyrion gets a visit from a loyal subject, but wonders if anyone in his family will help him out of his current predicament. Meanwhile, Tywin offers to work for the common good with a presumed enemy. Sam takes stock of the personnel at Castle Black. The Hound gives another life lesson to Arya, and Daenerys makes a decision outside the walls of Meereen.',8.35,'2014-04-21',NULL,4,NULL),(39,'Oathkeeper','1399','Jon welcomes volunteers. Bran, Jojen, Meera and Hodor seek shelter. Jaime and Brienne discuss his honor. Daenerys balances justice and mercy.',8.21,'2014-04-28',NULL,4,NULL),(40,'First of His Name','1399','Jon starts a new mission. Cersei and Tywin consider the next move for the Crown. Daenerys makes plans for the future after hearing the latest news from King\'s Landing. Lord Baelish and Sansa reach their destination.',8.10,'2014-05-05',NULL,4,NULL),(41,'The Laws of Gods and Men','1399','Tyrion faces his father in the throne room. Stannis and Davos put their faith in a new strategy. Daenerys\' sphere of influence expands.',8.59,'2014-05-12',NULL,4,NULL),(42,'Mockingbird','1399','Tyrion gains an unlikely ally. Daario asks Daenerys to allow him to do what he does best. Jon\'s warnings about the vulnerability of the Wall are ignored. Brienne follows a new lead. Arya and The Hound come across Rorge. Sansa discovers Littlefinger\'s true intentions for The Eyrie.',8.43,'2014-05-19',NULL,4,NULL),(43,'The Mountain and the Viper','1399','Unexpected visitors arrive in Mole\'s Town. Sam questions his decision regarding Gilly. Littlefinger\'s motives are questioned. Sansa is interrogated by Lord Royce. Arya and The Hound arrive at the Bloody Gate. Ramsay tries to prove himself to his father. Tyrion\'s fate is decided.',8.68,'2014-06-02',NULL,4,NULL),(44,'The Watchers on the Wall','1399','The Night\'s Watch attempts to defend Castle Black against Mance Rayder\'s massive wildling army, who plan to siege the fortress from the north, while a secret garrison of wildlings, including Ygritte, are poised to launch a surprise attack from the south.',8.51,'2014-06-09',NULL,4,NULL),(45,'The Children','1399','Circumstances change after an unexpected arrival from north of the Wall. Daenerys must face harsh realities. Bran learns more about his destiny. Tyrion sees the truth about his situation.',8.71,'2014-06-16',NULL,4,NULL),(46,'Season 5','1399','The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.',8.51,'2015-04-13','/yKOltUHsp9X7dXWIm0hNGcIQa4G.jpg',3,NULL),(47,'The Wars to Come','1399','Cersei and Jaime adjust to a world without Tywin; Varys reveals a conspiracy to Tyrion; Daenerys faces a new threat to her rule; Jon is caught between two kings.',8.02,'2015-04-13',NULL,4,NULL),(48,'The House of Black and White','1399','Arya arrives in Braavos; Podrick and Brienne run into trouble on the road; Cersei fears for her daughter\'s safety in Dorne as Ellaria Sand seeks revenge for Oberyn\'s death. Stannis tempts Jon; an adviser tempts Daenerys.',7.93,'2015-04-20',NULL,4,NULL),(49,'High Sparrow','1399','In Braavos, Arya sees the Many-Faced God; In King\'s Landing, Queen Margaery enjoys her new husband; Tyrion and Varys walk the Long Bridge of Volantis.',7.88,'2015-04-27',NULL,4,NULL),(50,'Sons of the Harpy','1399','The Faith Militant grow increasingly aggressive. Jaime and Bronn head south. Ellaria and the Sand Snakes vow vengeance.',7.97,'2015-05-04',NULL,4,NULL),(51,'Kill the Boy','1399','Daenerys makes a difficult decision in Meereen; Jon recruits the help of an unexpected ally; Brienne searches for Sansa; Theon remains under Ramsay’s control.',7.89,'2015-05-11',NULL,4,NULL),(52,'Unbowed, Unbent, Unbroken','1399','Arya trains. Jorah and Tyrion run into slavers. Trystane and Myrcella make plans. Jaime and Bronn reach their destination. The Sand Snakes attack.',7.67,'2015-05-18',NULL,4,NULL),(53,'The Gift','1399','Jon prepares for conflict. Sansa tries to talk to Theon. Brienne waits for a sign. Stannis remains stubborn. Jaime attempts to reconnect with family.',8.02,'2015-05-25',NULL,4,NULL),(54,'Hardhome','1399','Arya makes progress in her training. Sansa confronts an old friend. Cersei struggles. Jon travels.',8.73,'2015-06-01',NULL,4,NULL),(55,'The Dance of Dragons','1399','Stannis confronts a troubling decision. Jon returns to The Wall. Mace visits the Iron Bank. Arya encounters someone from her past. Daenerys reluctantly oversees a traditional celebration of athleticism. ',8.49,'2015-06-08',NULL,4,NULL),(56,'Mother\'s Mercy','1399','Stannis marches on Winterfell. With Daenerys missing, Meereen has to find a new custodian. Cersei seeks forgiveness for her sins. Jon deals with life back behind the wall.',8.35,'2015-06-15',NULL,4,NULL),(57,'Season 6','1399','Following the shocking developments at the conclusion of season five, survivors from all parts of Westeros and Essos regroup to press forward, inexorably, towards their uncertain individual fates. Familiar faces will forge new alliances to bolster their strategic chances at survival, while new characters will emerge to challenge the balance of power in the east, west, north and south.',8.96,'2016-04-25','/zvYrzLMfPIenxoq2jFY4eExbRv8.jpg',3,NULL),(58,'The Red Woman','1399','Jon Snow is dead. Daenerys meets a strong man. Cersei sees her daughter again.',8.06,'2016-04-25',NULL,4,NULL),(59,'Home','1399','Bran trains with the Three-Eyed Raven. In King’s Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night’s Watch stands behind Thorne. Ramsay Bolton  proposes a plan, and Balon Greyjoy entertains other proposals.',8.37,'2016-05-02',NULL,4,NULL),(60,'Oathbreaker','1399','Daenerys meets her future. Bran meets the past. Tommen confronts the High Sparrow. Arya trains to be No One. Varys finds an answer. Ramsay gets a gift.\n',8.10,'2016-05-09',NULL,4,NULL),(61,'Book of the Stranger','1399','Tyrion strikes a deal. Jorah and Daario undertake a difficult task. Jaime and Cersei try to improve their situation.',8.39,'2016-05-16',NULL,4,NULL),(62,'The Door','1399','Tyrion seeks a strange ally. Bran learns a great deal. Brienne goes on a mission. Arya is given a chance to prove herself.',8.49,'2016-05-23',NULL,4,NULL),(63,'Blood of My Blood','1399','An old foe comes back into the picture. Gilly meets Sam’s family. Arya faces a difficult choice. Jaime faces off against the High Sparrow.',8.07,'2016-05-30',NULL,4,NULL),(64,'The Broken Man','1399','The High Sparrow eyes another target. Jaime confronts a hero. Arya makes a plan. The North is reminded.',7.97,'2016-06-06',NULL,4,NULL),(65,'No One','1399','While Jaime weighs his options, Cersei answers a request. Tyrion’s plans bear fruit. Arya faces a new test.',8.09,'2016-06-13',NULL,4,NULL),(66,'Battle of the Bastards','1399','Jon Snow and Ramsay Bolton battle for Winterfell. In Mereen Daenerys deals with old foes and new alliances.',8.97,'2016-06-20',NULL,4,NULL),(67,'The Winds of Winter','1399','Cercei and Loras are about to face their trial. In Winterfell Davos confronts Melisandre. Bran has another glimpse into the past. Daenery makes a decicion before leaving Mereen. \n\nAnd winter has come.',8.90,'2016-06-27',NULL,4,NULL),(68,'Season 7','1399',NULL,9.20,NULL,'/19NPjmN6o3QGYfu8WnzgDSx75Ov.jpg',3,NULL),(69,'TBA','1399',NULL,9.21,'2017-07-17',NULL,4,NULL),(70,NULL,'1399',NULL,7.67,'2017-07-24',NULL,4,NULL),(71,NULL,'1399',NULL,7.86,'2017-07-31',NULL,4,NULL),(72,NULL,'1399',NULL,7.57,'2017-08-07',NULL,4,NULL),(73,NULL,'1399',NULL,8.20,'2017-08-14',NULL,4,NULL),(74,NULL,'1399',NULL,8.50,'2017-08-21',NULL,4,NULL),(75,NULL,'1399',NULL,8.50,'2017-08-28',NULL,4,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id_movie` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `imdb` varchar(45) DEFAULT NULL,
  `tagline` varchar(150) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `certification` varchar(10) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `fk_movie_media1_idx` (`media_id`),
  CONSTRAINT `fk_movie_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id_media`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_has_genre`
--

DROP TABLE IF EXISTS `movie_has_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_has_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `fk_movie_has_genre_genre1_idx` (`genre_id`),
  KEY `fk_movie_has_genre_movie1_idx` (`movie_id`),
  CONSTRAINT `fk_movie_has_genre_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id_genre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_genre_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id_movie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_has_genre`
--

LOCK TABLES `movie_has_genre` WRITE;
/*!40000 ALTER TABLE `movie_has_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_has_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id_season` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `episodes` int(11) DEFAULT NULL,
  `aired_episodes` int(11) DEFAULT NULL,
  `show_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id_season`),
  KEY `fk_season_show1_idx` (`show_id`),
  KEY `fk_season_media1_idx` (`media_id`),
  CONSTRAINT `fk_season_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id_media`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_season_show1` FOREIGN KEY (`show_id`) REFERENCES `show` (`id_show`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,1,10,10,1,2),(2,2,10,10,1,13),(3,3,10,10,1,24),(4,4,10,10,1,35),(5,5,10,10,1,46),(6,6,10,10,1,57),(7,7,7,0,1,68);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show`
--

DROP TABLE IF EXISTS `show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `show` (
  `id_show` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `imdb` varchar(45) DEFAULT NULL,
  `aired_day` varchar(20) DEFAULT NULL,
  `aired_time` varchar(5) DEFAULT NULL,
  `aired_timezone` varchar(20) DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `certification` varchar(10) DEFAULT NULL,
  `network` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `aired_episodes` int(11) DEFAULT NULL,
  `seasons` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id_show`),
  KEY `fk_show_media1_idx` (`media_id`),
  CONSTRAINT `fk_show_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id_media`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show`
--

LOCK TABLES `show` WRITE;
/*!40000 ALTER TABLE `show` DISABLE KEYS */;
INSERT INTO `show` VALUES (1,'game-of-thrones','tt0944947','Sunday','21:00','America/New_York',55,'TV-MA','HBO','us','http://youtube.com/watch?v=BpJYNVhGf1s','http://www.hbo.com/game-of-thrones','returning series','en',60,7,1);
/*!40000 ALTER TABLE `show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_has_genre`
--

DROP TABLE IF EXISTS `show_has_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `show_has_genre` (
  `show_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`show_id`,`genre_id`),
  KEY `fk_show_has_Genre_Genre1_idx` (`genre_id`),
  KEY `fk_show_has_Genre_show1_idx` (`show_id`),
  CONSTRAINT `fk_show_has_Genre_Genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id_genre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_has_Genre_show1` FOREIGN KEY (`show_id`) REFERENCES `show` (`id_show`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_has_genre`
--

LOCK TABLES `show_has_genre` WRITE;
/*!40000 ALTER TABLE `show_has_genre` DISABLE KEYS */;
INSERT INTO `show_has_genre` VALUES (1,1),(1,2),(1,11),(1,15),(1,32);
/*!40000 ALTER TABLE `show_has_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `about` varchar(500) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `image_path` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_media`
--

DROP TABLE IF EXISTS `user_has_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_media` (
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `watched` tinyint(4) NOT NULL,
  `watchlist` tinyint(4) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `add_date` datetime NOT NULL,
  `view_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`media_id`),
  KEY `fk_user_has_show_user1_idx` (`user_id`),
  KEY `fk_user_has_show_media1_idx` (`media_id`),
  CONSTRAINT `fk_user_has_show_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id_media`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_show_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_media`
--

LOCK TABLES `user_has_media` WRITE;
/*!40000 ALTER TABLE `user_has_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_media` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trackdb`.`user_has_media_AFTER_INSERT` AFTER INSERT ON `user_has_media` FOR EACH ROW
BEGIN

	DECLARE v_media_rating DECIMAL(4,2);
    
	SELECT rating INTO v_media_rating 
		FROM media 
			WHERE id_media = new.media_id;
    
    IF v_media_rating IS NULL THEN
		UPDATE media 
			SET rating = new.rating
            WHERE id_media = new.media_id;
    Else
		UPDATE media
			SET rating = ((new.rating+v_media_rating)/2)
            WHERE id_media = new.media_id;
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trackdb`.`user_has_media_BEFORE_UPDATE` BEFORE UPDATE ON `user_has_media` FOR EACH ROW
BEGIN
    DECLARE v_media_rating DECIMAL(4,2);
    DECLARE v_media_rating_before DECIMAL(4,2);
    DECLARE v_number_of_ratings INT DEFAULT 0;
    
	SELECT rating INTO v_media_rating 
		FROM media 
			WHERE id_media = new.media_id;
	
    SELECT count(*) INTO v_number_of_ratings FROM user_has_media 
		INNER JOIN media ON media_id = id_media;
    
    IF v_number_of_ratings > 1 THEN 
		SET v_media_rating_before = ((v_media_rating * 2)- old.rating);
	ELSE 
		SET v_media_rating_before = 0;
    END IF;
    
    IF v_media_rating_before = 0 THEN
		UPDATE media 
			SET rating = new.rating 
            WHERE id_media = new.media_id;
	ELSE
		UPDATE media
			SET rating = ((v_media_rating_before + new.rating)/2)
			WHERE id_media = new.media_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-01 21:52:26
