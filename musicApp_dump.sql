CREATE DATABASE  IF NOT EXISTS `musicApp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `musicApp`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: musicapp.cf3u0flvivkp.us-east-1.rds.amazonaws.com    Database: musicApp
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Album`
--

DROP TABLE IF EXISTS `Album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(100) NOT NULL,
  `release_date` date NOT NULL,
  `duration` int NOT NULL,
  `cover_art` blob,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `Album_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`Genre_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album`
--

LOCK TABLES `Album` WRITE;
/*!40000 ALTER TABLE `Album` DISABLE KEYS */;
INSERT INTO `Album` VALUES (1,'Honestly, Nevermind','2022-07-17',53,NULL,5),(2,'After Hours','2020-03-20',56,NULL,3);
/*!40000 ALTER TABLE `Album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artist`
--

DROP TABLE IF EXISTS `Artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artist` (
  `artist_ID` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(100) NOT NULL,
  `follower_count` int DEFAULT '0',
  `profile_pic` blob,
  PRIMARY KEY (`artist_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artist`
--

LOCK TABLES `Artist` WRITE;
/*!40000 ALTER TABLE `Artist` DISABLE KEYS */;
INSERT INTO `Artist` VALUES (1,'88glam',0,NULL),(2,'The Weeknd',1,NULL),(3,'Playboi Carti',0,_binary 'ï»¿'),(4,'Lil Uzi Vert',0,NULL),(5,'Drake',1,NULL),(6,'Kanye West',0,NULL),(7,'Kendrick Lamar',1,NULL),(8,'Tame Impala',0,NULL),(9,'Mac Miller',0,NULL),(10,'Frank Ocean',0,NULL),(11,'Metallica',0,NULL),(12,'Nirvana',0,NULL),(13,'Fred Again..',0,NULL),(14,'The Beatles',0,NULL),(15,'Ken Carson',0,NULL),(16,'Travis Scott',1,NULL),(17,'Harry Styles',0,NULL),(18,'Taylor Swift',0,NULL),(19,'Lil Baby',0,NULL),(20,'Lil Durk',0,NULL),(21,'Autumn!',1,NULL),(22,'Lil Nas X',0,NULL),(23,'Lil Tecca',0,NULL),(24,'Ed Sheeran',0,NULL),(25,'Billie Eilish',0,NULL),(26,'Ariana Grande',0,NULL),(27,'Justin Bieber',0,NULL),(28,'Dua Lipa',0,NULL),(29,'Doja Cat',0,NULL),(30,'David Guetta',0,NULL),(31,'Don Toliver',0,NULL),(32,'Kaytranada',0,NULL),(33,'SZA',0,NULL),(34,'Brent Faiyaz',0,NULL),(35,'Bad Bunny',0,NULL),(36,'J Balvin',0,NULL),(37,'Destroy Lonely',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0 \0 \0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0>\0\0\0\0\0!1A\"Qaq2¡#B±Áð3b\Ñ\á%4RSrsÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0$\0\0\0\0\0\0\0\0\0!1A\"aQ2qÿ\Ú\0\0\0?\0ø!6\å\ÐV´\äk«csjTÁ V´~\ß\Å*\ÔIh*O\æ# ·]\ä[Õò\Ü7³·\ßØº¯´\íJ\Ú\Ì7µ¤KKû\å\0|\àcò©\ÈU$¤´\ÑXuA ©ÐI?*@\åXº\á0­¼\Îö V\É\\ohG\ßÞ G\íÖ\Ó)Ú¾\ïPB]\ËM¶\n£w@i´\Ó\×ZX[\"B7&õö©\í+Z¨\ä¸TJ$OÖ«<%,%Æ»\È÷÷ª§(\Þ\Â8H\ä\Ð\rIJJ\Â	P\îU\Í\0J]N\n\íQPRBc\íTyCj	ÑEZ\\\Þ0yãòÕºù`NdúEiNm¥¥\ÒIP$O¤rh&´\Øq\\AÛ\íõ¢¤~\è\'~\âpPy^rP\0\Ä%<\ZnØ¥¤¥\ÆÀl(Âö4Cd((v Kô8\ËM¥·-Û¹p)/I\n\ì;W,²ù1\Ädt\Õö¥£9ñSj\ë÷i\Ü\Ê$þ \ßJ\ã·m]j³wG±\ÒÔ­\ïUzø\ã^YJG9ú\ÏjÜ»y\î2t±tî½gGn\ëIJQ¨\Û+\Õn\ë»\Òô\ÂB¸&3Y½ò\é\Üü{Tµv¯¬_R®-l´¨\îII\0g°ùq[\Ç)giZF«æ¤«#õ®¤®\Ón\"2H\ä\ÔKa*$\Ñ\í\ÅM%!H1ü$\n°*£>©1ó¨ \0T°IAU\n\ÞKd\r¢L¤s?Ø§a·²c¢¯ÖË·RfALGH\"Ð²\âIJ\É	ñU^Hý\è)Jö?§Ò¢-\Â	>©\ÜOa¿-\'Ñ¸\î\ïE}\nô\n\n\àóD¨¡\ä[\Þ4J¸$nó¾kw\\:a>¹zæ¸\Ö\ß <ù\Ëm¡@ó#øGÏoz\ã&\ÝnZV5\rs_Öm8%6À (ûÖ¸s¾÷\ãqoª\×\r¼\ã D¹$÷«\Ã:Ê¦u¯ °¶\ØQBDµN*Ë=-VAg\Ö:b­o\'V\r\'yHA3\Ê	2\rf\Ít\Þ9{qY\Íý5Û°(k¤»yò®Î¨\Üò\×Áö­Êb¸\"3\È«M\"6$-2;f÷ü\ê 6Hrq1\Å]*)JAÚ¡f(©µþþTP\ê\Ðj!p\Üg5½5T­\Å,;üª&q«+p\íØ@À\n\Ü!S÷ óMnRD9ù\Ôz\Õ=$O·4GTöM¥õÛ®\ÊF\á±Q\æq\\,\Ýw\×¤\êw]¼w¼\â·(\åXË\ZñM\îÖ\Ó6ÌÏ`\Æ¹¬=]r\Þ\Ý>°/¶EUTa\nZ±´#QQ¸y\Í2ù/0v8Ú~õ\Ús¿Ã³Õ·©\Ø\ÚÞ´×\å\ÃA\Ï-)ü\Ê?l~U\Å\\¹Vt[\Íó~ÄWX\â\ÑJACK\0D\Ìsò­´cATÅSA\æ0\08S\Â}@qH<\ç¤	\"?º\Ø\Ý\n!#núPk	²RPB§9ô\ßj\ÛR-BB£pE\ÓnL$ö*\Ìó@5²°@;ÀT\è\"YJ¡?zS)ó\nI\â>\âj&o§ê­!²\Ó÷+Bm\Ö\â\ÊP#ñwö¥r½ºk\Û:x-\Ó\'wq§k0ôvl\áj\âÝ´Ý¾¦\ÜI$µ\Í\Â\Öð\Ï&«Jð\çÃ5Z\Ò\Å~;t¸q-¥7hIQ0\å% }È¬\Ï\í\Óûü¯\Æ\ßð\áÿ\0ÿ\0Põ	³Ó\êYBl4u¸\ã\Î!\r¤®T¨ñ	0*ú\'ö?O5«ÿ\0\Ö./\á¬zÿ\0©\Ùn9i§6~ÐµRa\'\Ö/ßfÿ\0þ\"#\\\Ó4~\ÔtmE6\âþ\Ú\î÷^r\ïqe;Ö\ér+Zp\å/µ\Õg=¨½q{fË\Ùv\Ùb~P®u¬6£|=ùH±\Â1õ®±Á¦4Úh\Ò\Æ\í\Ð2;WE0*L\Øü\ê«\Ä\ì ö \Z)*R\à en<H#d÷ýjºIX\Û\åDm-Z\ÚJV \Ø\â?Ù®\è=3\â.l\Òõ\Ê6¸¿VÁN\'\Øü³A ·²N\Ñ\é\à÷û\Ð\r\Æ\Ò2\ê*\0rÁ4!ª`¾C·µDB½²qm/­\ÊMÅ«©uG\Ì\ÈW<\æ\æÝ¼WYkýg\â3§ONø\Ó\Õ(iJUý\Ï\í[G\"Ø¹H}{ÿ\0G\Ô\Z\Íp³WLù¦x\n[z\'\0~dQ|ÿ\0.»·ñ\Ã\rw¡ÙµÙªø|«k[öõj¶e,_±\é(Þ¥DKj=©\í-Ó¶^;0ö|A\ÄQÅ§ø\Z\Ð\Ò4ÿ\0ú¡ôÒºr\æ\ÑW\æ\îi]¥\Õ}ON.\ÕÙfW\êJ\ZZs8=\ÎMa¼;T\Ýf¨°Oÿ\0ôkq\Æö\Ôm\Ó´ \0~\Ò(>YZJH\Ì\çúQOy¿Ý3\Þ8¢:r\âB¸Á~tq½­§4\Ö\ç<ývKaI¡@\î+«fB})\ßP5Mn\Þr\ÄP	LðLM7RB} ò¢#´\\ºOÎµóÕ±c\ÑA\Ìý»\ÓKñÓ£\ÝzÇ¤<A±\Ö¯ Û¶7^\Ðkz\ì^H}»g\ÛxBü¢\êV0H\È\ç¶N¿\ã÷ú t/\"\í¿Sih\êN ¾°q7z·Ã±kæ¤»\å\îR\0¢F\èbj{\Ím¹ü{ö µÔhÏ±®Z]©\ÝM»¥º·\Ýd­·\n\çyY\áA{GzóËö÷\å0¸ú¤5ÿ\0C#B:²|1\ÒM\ÚÖ­Ì¿©Þª\ÜdÂ\ÖðR\ÈI&=ë¿¿ðFm\â7Ph\ÈÐµ\ÓtK\èÒ´kAoo\æ\ÄÊP÷Q1V]¼ùÉ\ÔÓ¬4+.¡Õ\Ñ\Ôó]<óEVn\Ýÿ\0Y\0,Ì°¸\íô0\ãU¦3ñ\Ú\àÙ©Ò¡\ßkqÁ¦¸\É\å8\0?¿u\Ó@þfvÏ·zn\ÉÞ4 a3\àó­;A¢#\èIV\åDN v¨6ö EtlÄª½2b&{+	J4\rP\Þ\Ù	I\äP5æ ¡ JI\ã1P\â\å6­©\ÍÀ	\É\ß\ß\ëR\ÝE@\ëû«\ëÇq\ÇZ` !nlB=C\0n&9\ÅykÑ\ÕI±\ê\ÕYijop\ÛLMr½òræ»ª9u¥¸\ê)Zü\ÚÀ\ç¹9ü«R8\Ü÷õ\ÎFò\í¼¥úTõY\äQµ1\çÏªº\âñgwV\Ý%f\ë¤,ð¦]¶\ÄHc\çO«9\ÅZ²²¸\é}mµ\Ý2¶\ÚTùn(BV;úVñ®:±t³\ÔZ¼ART\ï\×`­³9\â)¥9MIä§j(¥Düwþ\â\ÍnT\Ì\' 4\ÛÀO`:~À\ÛûT\n\ÛB4\èRI\Ägý¨\r\ænNÀLÞ\ÐBd´{\Ðõ¡A3Døb½@vGj¥S©5&´´9pòp\ãf (¨\æ0qö¼ö]ºnIµI»}M:-\Ã÷\í­wÚ.-K\0\ÚOð\à{v\ï+qN\\Ö6ªJ\0)$(W7¢]v¼Y\ê\r£HZ¿a½´Ã \Ð«ò­KÃ¼·]3zù\àû\Ë}!µp§ý)/&w×·%W!t¤8 I¥3ùMknÆm\Óôºµ\Å&\ì\Û+\ÎI-2\Ä\â­/ú\Ö3R\Å^Ü¾¼·x¥f\Ð6¶JJ¤~AD}©¾R\Ï\Æ\Ç/¡S«¹mD¸fº\Ç¶úN\Ù#\éZh@ 1@ALö\'ò1@4\îqP\á\íR\0¸\Þôûc9þ\â¨Ô­%±\n\ã\ç[j$!\\¦`z¶ù\Äû\Íõ»\é\í\í@;§GqA\Ã\ÖuuY²ó«mhm%G·\ÛW+má¹©6£»«)\r\êzr\ám¡´\Ëi&v1ß ®¥Þ¹\Ékð\ËE=a§õUÓ¿¿¾gM]\àe\ÂeB\Ò\ØOh\'Üj­a\Í\åÀý\Ý\í·Ã¹-¹Á\í\\%{}75Ue\Úõw`CH*LD®\Å\å×N½}ÿ\0;Q$%>¢üª{I\Ò\ã\â\Ê\Ý\æ\ìZ\Ø/U\Ôµ¶`ºµ(\"3\ÈÖ¤nó\Ò\Û\ã]\í½¯¢Ý%¶´ö,IIÿ\0\ÙI®\ßK6]\ÕÁ\Çm×µJ@b\áV®4;D¨}¹5{Lùqt-MZS\å]]#[ìº« ¸\Ó[uXt>\Ø2yª¢RT­\Ê$=P\ÆP¥$ò=ù¨¿üN\Èô\Æª4VvBf=\ëQg)\à¦\â\nTDÏ½U¥g\å\Î($8¢@ \í80{\Ñ®¬ñ6\ÏCEÅµª\Åî¢N\Ñþ[j\Ï\âWô¥fä³{\Ïõkµ9\åÀ$\ÂÏ¹úW\r/½pZ\Ôø¤¾øø¥¤@Gxûj¬K¦¹þú\Ì\è#½kx\á-õb9\Ø\ê¡L®>KHóºoË³\ÔÚ\ì\ëk:s¶ùO-\ïM³\Üùk¤(z¬ 2ø\ì\ç¿\äN³-¶·§j\r4X\Ö,S¹9¸AòDcù\×=Y\Üw\ãgG#¨5\ÍM³qjjC÷vcp¿«Öµ1\Êüc/.\Înÿ\0ñcð_¦oz¬­.Ðô<¿i¥¹\ë/ýn~\Äp\\_	IW|qõ\Ï\ß-É¦K\âv¸g\Ä{RµqEµ_/\á\Ý\n±\n\ÚÚú!&º|y\ï{©z\ÚûRS|]yn\Þ¿ÿ\0/j¶~ÿ\0Z\ç#W(ª¾\Ú\ê\Â\\l(\íQH\ìcµi\Ì4\ÙÜGÒ­¢õ¶	28\ÍYWkÅ\â.-Ð´z¸°FP[±Á\íUH\ç\âeC<î º&ùõ8£A\'RJ\Ì)Í©O\Å\r¥\Újctf@\íWhªø\×/\é\Ì\'N³pµtúw­Ô¶ |Ï¿µKY·\\2I°ÁI<Ee20{£¡¦¾«k\ÞieX[n\'\nBÐ~\Õ`úo\Å²\Ó:[®t\Ë\Öl\î:È·\æº-\Õz\Ù\Ûu§\Ü\r)P\ëE~Z\Ò`©\'[\Ï,OV¶Ñ½z\ÓW\ÐuThÃ¬Y86ÿ\0\ÂøÜ²\È\ÎQ>½\Óö÷Ú-zsFP\Ô\0\Ý\ç\ê®6¦\Ø\n\0\r¡)\ç{ªRDLP¦\Å\ÓW\ítGýQ\Õ6×¢ô®ÍQ\Õ½KQr\ã\É%¦ÁnrB_V	¾·8¾ix\0p0(æ®MD!@\Ñ¡Ú\ÍÑºñeF`H­Ekm¸IQ\Úy[h@¯\ÔvñA\×m\ÕJ²s@Ð$\É\Ïz\Û<[UL\ÐeÞ¤­[X»ºQ\âý?$\'ô±\Ýe\'lOù-Ü\ÈûV Ú¼\ë½\Zv¯\Ðj¢\ßGõ¿U¤\Þ\'\r\Ý${G¥c9\Ä\Õoò¥x\Ò\Þ ø2\ÓZf¶u~1û;P¹´jÿ\0Ou²%%J¼¹v&=\\YÓ\Ð\Ý%Õ¾/$²\ã¨Ðº1\ç_ßµlÕ\ÊJHBX\í¸\ä5	-q¼`ñ\Ã_]Nô\â\ÇI\è©ò­&n\\\ÈS\êsõ)DµR\ÝðË¬\Ë&\nc(\Z\à*\Ý=pmµVH1&&¬\Z\"%&Îº6kJ\Ü18À½rÙ*\Üö\Ð\Û!°°w\ß\åEqºÏ\Ñ/GdmûZ|e\\=<\ÄÖ \0j!dgp<N)\ØDZU\ë¥|w\ëÞÑ\Ò4>©¿²ÒIB¬\nó%IO\'\0MEÎ«Õ¾-u]\Ø\Û\ÙuR\ê:µ¼mný\Ê#Ba2\'1Ú\íS\ä\Îj24	Þ ñª ð3A\â&GÊ+\ÙxÑ\ÐiL¸·\ZJ\âº6b\ÈF>\ÑôEÕQ±\nÜ\É*¢Ç=\Û*9ª*#\Ù\é\r2I}üy	ÿ\0µfô\Í\á÷?­sd ÀúP9*&\àGnkCÀóP,\ÅPY\nj\Å$sD63@TQÚ}(?\Çrh\"(yoO±\rIp½`Ó%D§¿j\é\Z-Q\'¿\Ð¥9U ^(\0`sUIñ)`¤\É\íDQüB¸ó°F\íÀ!j8\àô¬\Öj¡k]²1ùP5®L(\n\ÌÖ¼òjóD9=ý\êÅäB3@\Øû\Ôp\È\Ü\Ð=\"U(\ïòª\">?yP]:n\áJ\ÒÒÀ\ä\Üj&¼\áØ¿T¨D\nª²6Ë¨d­M\É)\íZeÔ§xT\ÎA?¤T°b\åZZmÒ-9O\Î}\Ök*þ\Óõ8\â`S¹d{VY<$@\â¨vò19¨rkJð\ä\ÔBEUaª15Li\Ò2òG5 <c°­i^JJ\Ú\n¾k&\r.\ßvv\Ï\ÂZ©\Îq\í[5\ÝmR©\0÷­+¦\Ê\ÜR±jI\Ú`\È#4øKE¥\rÉ¿Ú%ûÁ½-\ä\í\àAÈk9Õ¬{N\ÑzoK¾³\ÝY4\èÙ¸6\'^_k>¾><,\æ	\Ô^h6V%ö\Z}§\Ôù\æ	?#IKñürn2U¥	»¸JgbW	ü\Íwu-BRsZCPÉ©¤\ä*´J#\Ü\Ð\Ñ?¡\Ñ%Q\r©Ó°M6½b\Ì:¶Ë )*\à\Í\ëL5\í6Ý´>\ÑÅÀi¶iyµRLr~U\ç\Ýÿ\0_[0\Õ\áR\ê\ÛS¡	mHJDEXåf\ä\Þ\Û\0L©5\Þ>f]®R¬·l\Íu\nVW1\Ì~µGi¦Zu\ÐU\é\ç(<µº$¤\Ø\äÆ6¸ò\ï¨\ä¦G\È\Z\Î],\í;¥\É,¶$©¡$ªÿ\0ò×»zñ\ãnûP9@>Â³;t\Ê\Û.\Øý¹\Ü]W¹ü\ë\Õ+ö8G~\ÕGJªBBôX÷A¡\ÓÀó\íP*	RH<pvRUú\ÔY\ÃqÓq\Æ\ãO\Ýa{\Õ^hú»½\Å;©w¶§¨\"e#t\Çü\Ö\ãÏùQ\Ùõkÿ\0\î\×ö¸RU\ë]B(*LGÊ\ÕÚ\è\ãð6¤©K\n pSÀ5D\rHo²pL\îRBg\ëYË¥\Æn­\Ý?dÕ³²·y\ïÁ¯¯­IÃ\â¥\å\éN(:cj 7E\\9®~{¬+1´d¦Ü¬ð²c\í^¨ùPP1#5Gó¤!DÐ	HBNMA\ê N\'¿½ùÀ÷ \ÜúGT}=j¤»\å%höQ\Ä=«\Çx¯³\ã\Ë\Û\äõ.m\îò\ËkJpGh­Kª\åÛ¬5­6£0k\Ó2ö¹-{a$­¨­Â%J\0#ª?ÿ\Ù'),(38,'Yeat',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0\0\n\Z\Z\Z!.%+!&8&+/1555\Z$;@;4?.451\Z\Z4!!!4144114=444141444444414414444?1144444444444?44114?ÿÀ\0\0\á\0\á\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0F\0\0\0\0\0!1AQ\"aq2¡Br±Áð#Rb\Ñá\Â3³ñ$45cs¢²\Ãÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0 \0\0\0\0\0\0\0\0\0\01!AQBqÿ\Ú\0\0\0?\0\êÐ°!¡B8@Q\ÂÐ8  (G2!@P\Ò0(\Â8 #f(\n)( +B8@¸p¡ (G\n@P 1hI¬H%Q\Ø\r\Ì®\"×U@¹°\×s½]¶­Uvª\îö\09Ø¹$½\îll\æÝ®ö\ß÷xd !q\ï7.E­E®e`ok\Ûy\ÎÓ\ãsûEd\Î\×p®\Â\æû\ZÁö»Ó³\ÓÈª÷¨¹	Vf[\änð[¡·º\ÅqJ4Á,\à\ÙY¬òB¾³\Í\ì\Ç1r[]XÜÇ©ß2IÇ¿¶\Æ\äÀ\Ò\Ò\èzN ìû\Ì\Ù\n]\å=ñ\Ýú\Ë\Ù\æ\Æ+\áT¡P£/;¦¸;\ßc\ë:f½¨S«d\Æ ¦\ÇL\ë|þ`u_=G[I¡\Ña,ÿ\0\éJ&\Ù^\æ\Ý\Æm.I\ntz7\"W¥[1*UzÚ}E\é´2«@CB+G\n)#¤¢¢\ÅB8@¸BÐB¡\ãþ\Ó;ARu¬R\àdº¹$\îu?\r´Ü·\Öo½¢\â\Õ0øw®\ìR\ÂÁB¨,\äh \ÙTsmô\Ð	\çüMr\î\ÕÝ\âN¦\×ü`R÷\Ì\ë\ë·\ËyD\\v\ÖN«òùþ²\Ë}Iýz\Ê\É\Ði\Î2\Ö\ÓÃ\Z\Ü5Á\ÓK^AÁ»xp\ÒY\Çü¤¨5\×ðü%\Öò@þ½ \Óq\ì/kT\n-{\0YÛ¾!\Ý×¯¹\ÒwP\ã\ß8r\ÞÁEô»\0I¹<.Ëª\Û}q\ç­GöWl\ÍG@9g\à9ºu¶ú\Â@¡PÈ\Æb0\Ñ@\Â`c´#B8\n)b+¢#T¨lª.OA\é+Zc;C÷tý\á¦@Ñ+6¦\ÖE`s6º­\í{N\í\â](\Ó,¨6`T³yy[:\êtþ¥@w{[]´?6r	7¹\Öúø\ï¬´a*R22\ÒCF\Ò9\Ì\êda¤\ËF\Ý%;BDª¦\Õ\ìï½u,Gov\ã+ró½­\ãi©^TJHt9YHe#pWPAðz½H\"\ãc¨ò0<0Í²¶RNe~\îk\Òú@\â1\Å\0!E%#$d`ÐsBpB\Æq\\3¢P7ÌaÛ\0\î,u\Þ\Ó):vß6.¥3¨-IûJ\äü\î=&´\â\ÚMûÚG\ÆSri`¾\ä\æ\ÏòO£\Âq5\Þ%\ÈO\Æ\Ã*\ë±\×[x\í\ãoLe£+m\æ}û\'TG`%\ìmM=@¼+²u\ÑA.¬\ä\ÙQA»±\Øfnxþ·<y~5¨\Í\Æó1[ª¯Q³|ªpo  úü¢\ÃpR\ç*\ÔU\ÔüVÛ°7¿\êñ\Î/ºa­¾\ÇpÔBU@%9lv7\0K,½3ea¢iYz7\Ù\Í`ü>µNönEÅ¼¼\ïy³\Î}\ìc­t¼0ð`¬¾\Ð` (G(âRF(\n\Â\Ä#!\0!F\"(\ã}¦j\ãq,\Å$N\éVG5µr\Â\Ç{x\ë\Â\âpõZ.­K)´´\Ý1XZu©\ÔP\È\Â\Ä\Íx÷\Ã\à\ßI\ËSP\ìPµ\×163Y¶\'A\Êyü²öôxr2x\Zµ±VPÀ,Ö¿tó\îF³R\â\\iR¡ZT^µ@26°¿\ÙP£NW\Ó[k{	²p¼k\â)\ß-\"86 Yö\r}t\\zU\É\Ý:[ò9jôõkl!\á8\ÌAÏaEv\nH&\ÞW°\Ã\Ó \Ì\ÝI_	J\ZÌõE#:0¾Á­}GS¤\ÉRÁÓ¢Z«µ®7v\î \è.c+I\"§\ÂA\Ò×º\Í{GV\×-B\ÙF´\Ëö£µFµ\éa\îfmx\ì<f¤\'£Ãu\æóg2õG\È\Î\ï>\Ï\Ø\ÏÉj\Õ*7t\è@P\ë{\ï:\Åp\'­M=\É^õ4{.Ãº \Ê\Ü\Ìi2°¡B!¡B8@PB¢\Å\0!\0!5_*\è	\éõ\å9´Yø:R \Ù¶\"ua~§=ý\'Q´\ãÔ¸¥Le.\èqv\ËqÀ\îm³\0l?¦2Ç\ÓXe\Ç-¶\Þ{Ì \ró_\âø\ä¥v¨@;¥\×|]4jt\Â)`>\\\Äeþ\r\Î\à\Íw«X\æ¬\ì\íÔtU\Z\å<7Z¯Uó\ãó\Ûn¯\Û5\ÚJ\Ìy[o\ëo)ªqN3_Aª÷e\Z(ñ°\Üù\Ë\Ô\í\é\"D\ë\âó\å\ä\Ë!\Òl\ÆLK\0`oþ\Ïûlp´k(j-e\Ïö\é÷´·Ä·f\'Kø\è\î\ÈÀA¸\"\àõi\ä\Äkk¼ô\ïdCþÅ\ÌÙ¹¦3^÷².·\ç­õ\éhJ\ËB;E£1CB2P(\n\Â\Äp4!@!@P(\Ö;SÁ\é\âi5:ÅZ\Ê\ç-\îUÝ\0n`|\Òlò\rMX\Ê	SpHÇ¨\è`yk`^W£PY\Û\ÔALt\ê\Ô8÷þ\Î\îM®s¨§QöPS{Ö¿.`\Æú\ÊK¼	\"v\0 !0	\á¼Rµ+\nu]6øð3¢\\¡\ÓO\ä%[¶·¸úzC?\"\ã\ç2Õ½«\â5§K7\\¬O\\Ö\î\å\'mw\Û×¬¶.I\Îtþ\ÔuV\íö\Ä\ÚÁj%6þ¦(þfkùZbµE\Û;\ã1¿£\",>M	\Ô\è:uñ\'\Ë\Ë\"Z\Ùpºâ7\íÀ\Ý*(u>§¼=G²}¹\Ã\ãH¤ÀÒ®Gû6\Õ^\Ã_vüü\ÞpVy:5X:±VR\n°6*À\Ü0=D¶D½G	\ì\Zý³\nÍ³\ê®Â¢\è\Ö\Ðÿ\0½3s\nPÐs@CB(\âHº\Ü}Á\"[\ã±ôh®z\Õ«°!¹ô7öMN\\%#S_ö.\ã~#\æm\ë,¥­ð\á]§\ßF\\¤\çR;\ËöJ3½\íE¯<ûÚpØ\Ô\Øvâ§¼ü¬=o6N\Ð{M\ÇT:L	¤¹MºbXy\ÜMj³_1$I$nw$\înabÉ²\È\Îvk³uqm{ä¤¿C°\Âõo \ç(qü\Ã\â=\è¿ðü\Ì;¤ß¤x\Ð^%KÊ¡m§9@¸ ¶\Ô\ï\Ë\Â%@7\Þ&}|\ÔbÝ¥]þ\É\Ûs\Ôô¦m\í\å\ÈJh~\Órú°¾­ò\ä¾0¿gýiL÷\Øzÿ\0H~¯*Ñ©ÌÈºvbØ»\Ó\Ä\ÒþJýõe?ýé{?½\ÅüºG\ë:\ì\ÍAB\Ì!hCB\ïh;c\ÂTjgjsE¾®Ä/¶ `5$òûµ>\ÐBCf}R.«­»\í§÷j;oSjj=\ÚsP÷\Ìz9ùm\ç4¼MB\ÏM<D\Ü\Ç\íL¯\È|WR«¨\ì\Ä\î\írOó18\Ìa=Ñ°\Ð{\Æ	ktõ¼¶Zy½\"\ÒO\Ôb\0\ç++XwGYs§f®R§byRie\ÚÒ¯¦ÒµK\×\ç\'G\rö\ÐL´\ÊñN>õi¦\ÝQT\0¢\ìÇ½Í¦S\Â\\Zr\ÈZ W(¿8\é\'3%TC1Y·`l\í{§\è%aTs©-Ï¼dVCk\Ï!\Ó\ÆK|Fþ\n\\\è>­\é\"\í¦ºK\ÌùÂk\è\Ì\ÈmO\ÐDnt\Øt\ÉnR\r÷YQdeÔ½\'\ß\ÉH|\Ù\Ï\å:Ñ¯Ø«ûH\æE#\èõ	\Õ$¡B8@¸!\rB§Æ­\nU+¸º¢379F\Ã\ÏoY\ç)\Æ*b*½z­\ßrN(° \Ã\Òu¯i|qÂ£õ-\no¯6Ó¥ü\'\ZÆ¥3s{?òx±Ö®\ä_]\Íý`õ3-\ãR<¹\ÊO¨\Þý³]¼\ï-¨^C\Ìúel=\Î<è¤±þ\ÒÑ±\ç(6ü¹\É\Ñ7W*\ÕOm\\òÔ-`6ýup÷\ÜÛ=\0\Þf\í¼d::\êÚOô\×¶ò\×¹ö.\\ü ¤\ÊDÉ}$X\Ë\"Ze6Uv\ÓIA·¼RE*ùJô\Ës\Î\Úu·_	\Zj\ÌÀ¹sf\áý\ÇW¨á¡Ù§ÉÙ­]5\æV:O[h<¿¬¤üõ{8â¿ºOýÕ¼°\Åv¦øv?qÑ¿?¬\ë/Æ¸\Äÿ\0y:wÁ\â)wjS¨}\ÐúKF7\Üz-]id\Ô\ÈXò¿û!¬\Ã\Z\ëR¬yd`~Y\Ûgö)V­ª~$¦¿\â1-ÿ\0\r~s°IPB\\B!5^\Þva¨ûµ?¼ªÊ»3~C×¤I±\Ì}¡\âñoR]K.½r¨RGjxv\'¬»\Çbso,\rnó®½9Ûº´`É¶£¤#À*I$r\Þó\rH!\ï+¥«bu:\ÈJ8u%®7yõ^\É&!}%ks+U¸·Sô\ßð)øA\ßI<=R¦DR\Ähª ³4\Øøú\ÉjÈ¸Ã¦Uñ´\äi©°©?\Ùp\Ç\Õ\ÝRsjÏ\ä¢\í	Ð¸d°Zy»õ+\0KVU±Rw÷e´A\È.:É¹\ZÓQ\ìý5Sû^2¦\ÊjT±Eq\ÜS¡\ïn²«\ÃR\Ó\Ã-zPµ\êeD\0:³2S\"\à2÷µ\Öu\ÜbxS a\ßr\ì\å\æsf\×^r\'Ù¿>ã¶y\'\n\áC^FE\Úu#\ìN´1l¿\ËQù/\àf\r\ì«*¢Ô©E©\\\å\Ã{»öR£[_\âñ¬\ç²\ÞÆ E\Ç\âP380¸T\åPlw\çN LIL(@\0\0\0\04\0	i\ÊÝºHLe\'0gõ*Nw\'I%F\íapÕz?º}î£º\ßyvõZÙgÓ§	g·\â\\b	\í%\È>cq,W_\ê?¤\íSÇ»K]}û-;Y{¤g\Ëo\ï\ãòrõ^\'c\î:O±\×þÿ\0¬\êÓ{»&)ù¤¿\ï({ýùÎ¥:\×#hG	^8B\Zcø\ÏzeòsÝ§MA,\îvP.d\ì\0$\ÎSÄ»3\ÅñÕªlr=@¥G\ÙP0\0yÎÄ¦lä¨²\ßr/rv6ö\Ðtá®Ïw@»©ab?ö½ü-­¦&vt\ß	{r>#\Øþ\'J\å°\îÀ}ªl?ø©\Íô\ÍV*Jºaº°*\Ã\Ìg¤\Å6¿@O\"zø	\â¼Rµ\é¥M46³\rlJ°³x[ö%ñ\É\Õy\Õ\È\ë\nj9µ4w=Yÿ\0=Â»Ã¼Jf\Ö!5BN\à÷É·#\ë2\éoB­´\Èk-\Ú¤úKs\Ù1p~\Ù$\ê2a*]ÀA¯ô\Ùv0\ßÖ£Hk±j|B\Öv4[0Ñ¹;\è¢\Ý73R·¹½þôð¿Y9Õ¸´¬³\Ü\rýCR»mglM~m7\Þ¡I-F:`òD¼ms\Ëy¯\Ó\Å1`#^{\\ý\æÇ¯\Üø\Û\Ê\æß\"cO*KT\È\rÍ¨6Ó¼yK¸ °­ñ¬Dv\0x\Ï,\Ýq\Ãõ\\Z!²t6ôIUqs\ÃRµs*·¿E\Þgip\Ô\Z±,~BþBb\\«vcö eJ.I¸½ý$Ê \Z \å}\0ó\ÖA\Ý%Eµ\ÛS\á}´ÿ\0Yõò.}\æ[Ô©(µKt\ïV.K*µ*KJNò\Ý\Ì\çk´\Å&y	\ë\â5Z­K3t§S\Ê\Ü\ÉOt·M{·\\lapý\ÓûÚT?ý?\'\'\àª(\á\×;µ\É$\Ø\0-vf;9q\Ú.0ø\ÌC\×m\î¢\n\Ý_=\Éñ&o¾\Äð¯^­¾\nJø»\ßðI\ë\Ã1\â\Ï>U¿ö²Ã\á\Í,ù\Ý\ß;°\\\ÙBQ¾P=M\Î\Û\r8M°P!\å<C\Ù	ýk\'(c¾Q3õZ\Æ{>&k[\ïxÕ¶Py^^R\n¿¶\ßAaôC*\r\'ZôY\ÌHd93¬ºñ\Ö\ì@i\ÖTÃ¦¡K\Ì/o\áNñ\Ðm\Ì\È\ãp¥\ÜTJ:ûu)@{\×\'v$\\ôôð\ä\Ï\Ö\Z½Ô¡\Îÿ\0G*>JH§0\Zé¾º\Úù÷cMÿ\0xö$ªBI\'P3s\ë>O-÷\Ý\ßç\ä\Ô\ÅpüA}ò  \Ý\èv\ÊÉ½¶ø¾\åaf2REP\0\è\0*bm¤%\â§W\ÑÐ¸½À$þ|W!¥´õ±³s/VÅ¹¡eU?f:\ÏÝ®\ç\ïmÓ¬+Vc#/\ã\ê.¬wþ\Zk\ÍÜ\Ãsõgé¥ª;\nµ\Æ\î\ßg¨D\Z úõ3Áx\n`\×\"»\Õk·^Dy¼¼:k\Ìü¢H\ÆY]iwWÉª\èy¯/)LXe6 ­\Ô\Äs\×Ss¯õ\Z­\îü\îG$¤¶Ok÷\ÄJF¬I$£9\î\×_P\Ì^\î]`Kz\Ï\Ò[4²\íkT\ËViR»JH·\ëj´ig,ö\Úo\ÚöJ\rûªm\ßaµG\Zi\ÕWP:fö\Ú?Ù©5#j\ÕT\æ`u§L\èO6 xzNDz|Xk\Ýy¼\Ùÿ\0X¬wc8<JHÖ¥b\ÝEP>¥\çI\é^\Æpÿ\0q\Ã\Ò\"\Ì)o¾÷vú´ô<¬\ä !#B\n²7\á&3êµqdw\Ú#\Ñõ®)\Ë\î·\â!	gÙ\çø\Ì\à\ØB\ÅQ©-[õò&jµ®\Û\Ýjù©f/³?ýFüLpt\Í\í¾b~?òªX\Ôø\ï7\çMN¯dû?§\á3#a\å&kXV(Dt©T\Úc!.=-1T!	\Êv\ézq¯h\ßøoðÿ\0\á¤\×Wõõ\'»£ÁuZ\ã\Ïó­£ð¯\Ý&N!Bÿ\Ù'),(39,'21 Savage',1,NULL);
/*!40000 ALTER TABLE `Artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Followers`
--

DROP TABLE IF EXISTS `Followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Followers` (
  `user_ID` int NOT NULL,
  `artist_ID` int NOT NULL,
  PRIMARY KEY (`user_ID`,`artist_ID`),
  KEY `artist_ID` (`artist_ID`),
  CONSTRAINT `Followers_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `User` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Followers_ibfk_2` FOREIGN KEY (`artist_ID`) REFERENCES `Artist` (`artist_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Followers`
--

LOCK TABLES `Followers` WRITE;
/*!40000 ALTER TABLE `Followers` DISABLE KEYS */;
INSERT INTO `Followers` VALUES (15,1),(15,2),(15,3),(15,5),(15,7),(15,11),(15,16),(15,20),(15,21),(22,39);
/*!40000 ALTER TABLE `Followers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `update_follower_count` AFTER INSERT ON `Followers` FOR EACH ROW BEGIN
    -- Increment the follower count when a new follower is added
    UPDATE Artist SET follower_count = follower_count + 1 WHERE artist_ID = NEW.artist_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `decrease_follower_count` AFTER DELETE ON `Followers` FOR EACH ROW BEGIN
    -- Decrement the follower count when a follower is removed
    UPDATE Artist SET follower_count = follower_count - 1 WHERE artist_ID = OLD.artist_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `Genre_ID` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) NOT NULL,
  PRIMARY KEY (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Pop'),(2,'Hip-Hop'),(3,'R&B'),(4,'Rock'),(5,'Electronic'),(6,'Country'),(7,'Jazz'),(8,'Classical'),(9,'Reggae'),(10,'Folk'),(11,'Blues'),(12,'Soul'),(13,'Funk'),(14,'Disco'),(15,'Techno'),(16,'House'),(17,'EDM'),(18,'Metal'),(19,'Punk'),(20,'Indie'),(21,'Alternative'),(22,'K-Pop'),(23,'Reggaeton'),(24,'Trap'),(25,'Dance'),(26,'Latin'),(27,'Ska'),(28,'Gospel'),(29,'Rap');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LikedSongs`
--

DROP TABLE IF EXISTS `LikedSongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LikedSongs` (
  `user_ID` int NOT NULL,
  `song_ID` int NOT NULL,
  `date_and_time_liked` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_ID`,`song_ID`),
  KEY `song_ID` (`song_ID`),
  CONSTRAINT `LikedSongs_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `User` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `LikedSongs_ibfk_2` FOREIGN KEY (`song_ID`) REFERENCES `Song` (`song_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikedSongs`
--

LOCK TABLES `LikedSongs` WRITE;
/*!40000 ALTER TABLE `LikedSongs` DISABLE KEYS */;
INSERT INTO `LikedSongs` VALUES (18,30,'2023-06-21 18:42:14');
/*!40000 ALTER TABLE `LikedSongs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Playlist`
--

DROP TABLE IF EXISTS `Playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Playlist` (
  `playlist_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `cover_image` blob,
  `playlist_like_count` int DEFAULT '0',
  `user_ID` int DEFAULT NULL,
  PRIMARY KEY (`playlist_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `Playlist_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `User` (`user_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Playlist`
--

LOCK TABLES `Playlist` WRITE;
/*!40000 ALTER TABLE `Playlist` DISABLE KEYS */;
INSERT INTO `Playlist` VALUES (1,'New Playlist','new_user',0,NULL,0,NULL),(2,'My Playlist','John Doe',0,NULL,0,NULL),(3,'My Playlist','John Doe',0,NULL,0,NULL),(4,'My Playlist','John Doe',0,NULL,0,NULL),(5,'My Playlist','John Doe',0,NULL,0,NULL),(6,'My Playlist','John Doe',0,NULL,0,NULL),(7,'My Playlist','John Doe',0,NULL,0,NULL),(8,'My Playlist','John Doe',0,NULL,0,NULL),(9,'My Playlist','John Doe',0,NULL,0,NULL),(10,'My Playlist','John Doe',0,NULL,0,NULL),(11,'My Playlist','John Doe',0,NULL,0,NULL),(12,'My Playlist','John Doe',0,NULL,0,15),(13,'My Playlist','John Doe',0,NULL,0,15),(14,'My Playlist','John Doe',0,NULL,0,15),(15,'My Playlist','John Doe',0,NULL,0,15),(16,'My Playlist','John Doe',0,NULL,0,15),(17,'My Playlist','John Doe',0,NULL,0,15),(18,'My Playlist','John Doe',0,NULL,0,15),(19,'My Playlist','John Doe',0,NULL,0,15),(20,'My Playlist','John Doe',0,NULL,0,15),(21,'My Playlist','John Doe',0,NULL,0,15),(22,'My Playlist','John Doe',0,NULL,0,15),(23,'My Playlist','John Doe',0,NULL,0,15),(24,'My Playlist','John Doe',0,NULL,0,15),(25,'My Playlist','John Doe',0,NULL,0,15),(26,'My Playlist','John Doe',0,NULL,0,15),(27,'My Playlist','John Doe',0,NULL,0,15),(28,'My Playlist','John Doe',0,NULL,0,15),(29,'My Playlist','John Doe',0,NULL,0,15),(30,'My Playlist','John Doe',0,NULL,0,15),(31,'My Playlist','John Doe',0,NULL,0,15),(32,'DJChiggy','Chirag',0,NULL,0,15),(33,'DJCHIG','Chig',0,NULL,0,15),(34,'hi','hw',0,NULL,0,15),(35,'wumbo','spongebob',0,NULL,0,15),(36,'hahaha','',0,NULL,0,15),(37,'hahahah','hahahah',0,NULL,0,15),(38,'kdfdskfl','sdfjsdfs',0,NULL,0,15),(39,'wumbo','sponge',0,NULL,0,15),(40,'Test2','Javier',0,NULL,0,15),(41,'wumbo','wumboo',0,NULL,0,18),(42,'wumbo','wumbo',0,NULL,0,18),(43,'wumboooo','wumboooo',0,NULL,0,18),(44,'asdassd','asdsasd',0,NULL,0,18),(45,'asdasd','asdad',0,NULL,0,18),(46,'3','asd',0,NULL,0,18),(47,'drake','drakeee',0,NULL,0,18),(48,'playlist1','arhat05',0,NULL,0,17),(49,'newPlaylist','Me',0,NULL,0,22),(50,'Enter','Enter',0,NULL,0,22);
/*!40000 ALTER TABLE `Playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlaylistLikes`
--

DROP TABLE IF EXISTS `PlaylistLikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlaylistLikes` (
  `user_ID` int NOT NULL,
  `playlist_ID` int NOT NULL,
  PRIMARY KEY (`user_ID`,`playlist_ID`),
  KEY `playlist_ID` (`playlist_ID`),
  CONSTRAINT `PlaylistLikes_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `User` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PlaylistLikes_ibfk_2` FOREIGN KEY (`playlist_ID`) REFERENCES `Playlist` (`playlist_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlaylistLikes`
--

LOCK TABLES `PlaylistLikes` WRITE;
/*!40000 ALTER TABLE `PlaylistLikes` DISABLE KEYS */;
INSERT INTO `PlaylistLikes` VALUES (18,50);
/*!40000 ALTER TABLE `PlaylistLikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlaylistSongs`
--

DROP TABLE IF EXISTS `PlaylistSongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlaylistSongs` (
  `playlist_ID` int NOT NULL,
  `song_ID` int NOT NULL,
  PRIMARY KEY (`playlist_ID`,`song_ID`),
  KEY `song_ID` (`song_ID`),
  CONSTRAINT `PlaylistSongs_ibfk_1` FOREIGN KEY (`playlist_ID`) REFERENCES `Playlist` (`playlist_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PlaylistSongs_ibfk_2` FOREIGN KEY (`song_ID`) REFERENCES `Song` (`song_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlaylistSongs`
--

LOCK TABLES `PlaylistSongs` WRITE;
/*!40000 ALTER TABLE `PlaylistSongs` DISABLE KEYS */;
INSERT INTO `PlaylistSongs` VALUES (37,3),(8,4),(11,4),(33,4),(37,4),(39,4),(48,4),(49,4),(8,5),(11,5),(34,5),(37,5),(48,5),(33,6),(34,6),(37,6),(48,6),(8,7),(11,7),(33,7),(34,7),(37,7),(48,7),(33,8),(38,8),(38,9),(40,21),(40,23),(40,24),(40,25),(49,25),(41,26),(49,26),(42,27),(49,27);
/*!40000 ALTER TABLE `PlaylistSongs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Song`
--

DROP TABLE IF EXISTS `Song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Song` (
  `song_ID` int NOT NULL AUTO_INCREMENT,
  `song_name` varchar(100) NOT NULL,
  `release_date` date NOT NULL,
  `duration` int NOT NULL,
  `language` varchar(50) NOT NULL,
  `album_id` int DEFAULT NULL,
  PRIMARY KEY (`song_ID`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `Song_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Album` (`album_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Song`
--

LOCK TABLES `Song` WRITE;
/*!40000 ALTER TABLE `Song` DISABLE KEYS */;
INSERT INTO `Song` VALUES (3,'Intro','2022-07-17',1,'English',1),(4,'Sticky','2022-07-17',3,'English',1),(5,'Falling Back','2022-07-17',4,'English',1),(6,'Texts Go Green','2022-07-17',3,'English',1),(7,'Currents','2022-07-17',4,'English',1),(8,'Massive','2022-07-17',3,'English',1),(9,'Flights Booked','2022-07-17',3,'English',1),(10,'Overdrive','2022-07-17',3,'English',1),(11,'Calling My Name','2022-07-17',4,'English',1),(12,'A Keeper','2022-07-17',3,'English',1),(13,'Jimmy Cooks','2022-07-17',4,'English',1),(14,'Liability','2022-07-17',4,'English',1),(15,'Tie That Binds','2022-07-17',4,'English',1),(16,'Down Hill','2022-07-17',4,'English',1),(17,'Alone Again','2020-03-20',4,'English',2),(18,'Too Late','2020-03-20',4,'English',2),(19,'Hardest To Love','2020-03-20',4,'English',2),(20,'Scared To Live','2020-03-20',4,'English',2),(21,'Snowchild','2020-03-20',4,'English',2),(22,'Escape From LA','2020-03-20',5,'English',2),(23,'Heartless','2020-03-20',4,'English',2),(24,'Faith','2020-03-20',4,'English',2),(25,'Blinding Lights','2020-03-20',4,'English',2),(26,'In Your Eyes','2020-03-20',4,'English',2),(27,'Save Your Tears','2020-03-20',4,'English',2),(28,'Repeat After Me (Interlude)','2020-03-20',4,'English',2),(29,'After Hours','2020-03-20',6,'English',2),(30,'Until I Bleed Out','2020-03-20',4,'English',2);
/*!40000 ALTER TABLE `Song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SongArtist`
--

DROP TABLE IF EXISTS `SongArtist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SongArtist` (
  `song_ID` int NOT NULL,
  `artist_ID` int NOT NULL,
  PRIMARY KEY (`song_ID`,`artist_ID`),
  KEY `artist_ID` (`artist_ID`),
  CONSTRAINT `SongArtist_ibfk_1` FOREIGN KEY (`song_ID`) REFERENCES `Song` (`song_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SongArtist_ibfk_2` FOREIGN KEY (`artist_ID`) REFERENCES `Artist` (`artist_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SongArtist`
--

LOCK TABLES `SongArtist` WRITE;
/*!40000 ALTER TABLE `SongArtist` DISABLE KEYS */;
INSERT INTO `SongArtist` VALUES (17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(13,39);
/*!40000 ALTER TABLE `SongArtist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `email_id` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `profile_pic` blob,
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (12,'new_user@example.com','new_user','new_password','New','User','2000-01-01',NULL),(15,'new_user@example.com','new_user_test','new_password','New','User','2000-01-01',NULL),(16,'chiragkchadha@gmail.com','chirag','Password123@','Chirag','Chadha','2003-01-04',NULL),(17,'arhat.p.shah@gmail.com','arhat05','Password123!','Arhat','Shah','2003-07-21',NULL),(18,'chiggy@defye.us','chiggy','chiggy','chiggy','chiggy','2003-01-04',NULL),(20,'chiggy5@defye.us','chiggy4','paSSword123@!','chiggy1','chiggy2','2002-01-04',NULL),(22,'dveretenov@gmail.com','dveretenov','password','Daniel','Veretenov','2003-09-04',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'musicApp'
--

--
-- Dumping routines for database 'musicApp'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddSongToPlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `AddSongToPlaylist`(
    IN playlist_id INT,
    IN song_id INT
)
BEGIN
    INSERT INTO PlaylistSongs (playlist_id, song_id)
    VALUES (playlist_id, song_id);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatePlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `CreatePlaylist`(
    IN name VARCHAR(100),
    IN author VARCHAR(100),
    IN user_ID INT
)
BEGIN
    INSERT INTO Playlist (name, author, user_ID)
    VALUES (name, author, user_ID);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteSongFromPlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `DeleteSongFromPlaylist`(
	IN p_playlist_id INT,
    IN p_song_id INT
)
BEGIN
	DELETE FROM PlaylistSongs
    WHERE playlist_ID = p_playlist_id AND song_ID = p_song_id;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FollowArtist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `FollowArtist`(
    IN user_ID INT,
    IN artist_ID INT
)
BEGIN
    INSERT INTO UpdateUserDetailsFollowers (user_ID, artist_ID) VALUES (user_ID, artist_ID);
    UPDATE Artist SET follower_count = follower_count + 1 WHERE artist_ID = artist_ID;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPlaylistSongs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `GetPlaylistSongs`(
	IN playlist_id INT
)
BEGIN
	SELECT Song.song_ID, Song.duration, Song.language, Song.album_ID, Song.song_name, Song.release_date
    FROM Song
    INNER JOIN PlaylistSongs ON Song.song_ID = PlaylistSongs.song_ID
    WHERE PlaylistSongs.playlist_ID = playlist_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserIdByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `GetUserIdByUsername`(
    IN old_username VARCHAR(50),
    OUT user_id INT
)
BEGIN
    SELECT user_id INTO user_id FROM User WHERE username = old_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LikePlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `LikePlaylist`(IN user_id INT, IN playlist_id INT)
BEGIN
    INSERT INTO PlaylistLikes (user_id, playlist_id) VALUES (user_id, playlist_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LikeSong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `LikeSong`(IN user_id INT, IN song_id INT)
BEGIN
    INSERT INTO LikedSongs (user_id, song_id, date_and_time_liked) VALUES (user_id, song_id, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoginUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `LoginUser`(
	IN `user` VARCHAR(50),
    IN `pass` VARCHAR(50)
)
BEGIN
    SELECT * FROM User WHERE username = `user` AND password = `pass`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `RegisterUser`(
    IN email_id VARCHAR(255),
    IN username VARCHAR(50),
    IN password VARCHAR(255),
    IN first_name VARCHAR(50),
    IN last_name VARCHAR(50),
    IN date_of_birth DATE
)
BEGIN
    INSERT INTO User (email_id, username, password, first_name, last_name, date_of_birth)
    VALUES (email_id, username, password, first_name, last_name, date_of_birth);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `SearchAll`(
    IN search_query VARCHAR(100)
)
BEGIN
    SET @pattern = CONCAT('%', search_query, '%');

    -- Search in Song
    SELECT Song.song_id AS id, Song.song_name AS name, Album.album_name AS album_name, GROUP_CONCAT(DISTINCT Artist.artist_name) AS artist_name, 'song' AS type
    FROM Song
    LEFT JOIN Album ON Song.album_ID = Album.album_ID
    LEFT JOIN SongArtist ON Song.song_id = SongArtist.song_ID
    LEFT JOIN Artist ON SongArtist.artist_ID = Artist.artist_ID
    WHERE Song.song_name LIKE @pattern OR Artist.artist_name LIKE @pattern OR Album.album_name LIKE @pattern
    GROUP BY Song.song_id

    UNION ALL

    -- Search in Artists table only
    SELECT Artist.artist_id AS id, Artist.artist_name AS name, NULL AS album_name, NULL AS artist_name, 'artist' AS type
    FROM Artist
    WHERE Artist.artist_name LIKE @pattern

    UNION ALL

    -- Search in Albums table only
    SELECT Album.album_id AS id, Album.album_name AS name, NULL AS album_name, NULL AS artist_name, 'album' AS type
    FROM Album
    WHERE Album.album_name LIKE @pattern;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UnlikePlaylist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `UnlikePlaylist`(IN user_id INT, IN playlist_id INT)
BEGIN
    DELETE FROM PlaylistLikes WHERE user_id = user_id AND playlist_id = playlist_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UnlikeSong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `UnlikeSong`(IN user_id INT, IN song_id INT)
BEGIN
    DELETE FROM LikedSongs WHERE user_id = user_id AND song_id = song_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `UpdateUserDetails`(
    IN p_user_id INT,
    IN new_email_id VARCHAR(255),
    IN new_username VARCHAR(50),
    IN new_password VARCHAR(255),
    IN new_first_name VARCHAR(50),
    IN new_last_name VARCHAR(50),
    IN new_date_of_birth DATE
)
BEGIN
    -- First, ensure that the new_username isn't already used by another user
    IF NOT EXISTS (SELECT * FROM User WHERE username = new_username AND user_id != p_user_id) THEN
        UPDATE User
        SET email_id = new_email_id, username = new_username, password = new_password,
        first_name = new_first_name, last_name = new_last_name, date_of_birth = new_date_of_birth
        WHERE user_id = p_user_id;
        COMMIT;
    ELSE
        -- Handle the error appropriately.
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists for another user';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21 14:55:01
