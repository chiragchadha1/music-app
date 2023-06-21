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
INSERT INTO `Artist` VALUES (1,'88glam',0,NULL),(2,'The Weeknd',1,NULL),(3,'Playboi Carti',0,_binary '﻿'),(4,'Lil Uzi Vert',0,NULL),(5,'Drake',1,NULL),(6,'Kanye West',0,NULL),(7,'Kendrick Lamar',1,NULL),(8,'Tame Impala',0,NULL),(9,'Mac Miller',0,NULL),(10,'Frank Ocean',0,NULL),(11,'Metallica',0,NULL),(12,'Nirvana',0,NULL),(13,'Fred Again..',0,NULL),(14,'The Beatles',0,NULL),(15,'Ken Carson',0,NULL),(16,'Travis Scott',1,NULL),(17,'Harry Styles',0,NULL),(18,'Taylor Swift',0,NULL),(19,'Lil Baby',0,NULL),(20,'Lil Durk',0,NULL),(21,'Autumn!',1,NULL),(22,'Lil Nas X',0,NULL),(23,'Lil Tecca',0,NULL),(24,'Ed Sheeran',0,NULL),(25,'Billie Eilish',0,NULL),(26,'Ariana Grande',0,NULL),(27,'Justin Bieber',0,NULL),(28,'Dua Lipa',0,NULL),(29,'Doja Cat',0,NULL),(30,'David Guetta',0,NULL),(31,'Don Toliver',0,NULL),(32,'Kaytranada',0,NULL),(33,'SZA',0,NULL),(34,'Brent Faiyaz',0,NULL),(35,'Bad Bunny',0,NULL),(36,'J Balvin',0,NULL),(37,'Destroy Lonely',0,_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0�\0�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0>\0\0\0\0\0!1A\"Qaq�2��#B���3b\�\�%4RSrs���\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0$\0\0\0\0\0\0\0\0\0!1A\"aQ2q�\�\0\0\0?\0�!6\�\�V��\�k�c�sj�T���V��~\�\�*\�Ih*O\�# �]\�[Ւ�\�7��\�ؚ���\�J\�\�7��K�K�\�\0|\�c�\�U$��\�XuA �ПI?*@\�X�\�0��\���V\�\\oh�G\�ޠG\�֖\�)ڍ��\�PB]\�M�\n����w@�i�\�\�ZX[�\"B7&����\�+Z�\�TJ�$�O֫<%,%ƻ��\�����(�\�\�8�H\�\�\rIJJ\�	P\�U\�\0�J]N��\n���\�QPRBc\�TyCj	�љ�EZ\\\�0y�㚂�պ��`Nd��EiNm��\�IP$O�rh&�\�q\\A�ہ\�����~\�\'~\�pPy^rP\0\�%<\Znإ��\��l(����4Cd((v��K�8\�M��-۹p)/I\n�\�;W,��1\�dt\����9�S�j�\��i\�\�$� \�J\�m]j��wG�\�Ԗ�\�Uz��\�^YJG9�\�jܻy\�2t�tgGn\�IJQ�\�+\�n\�\��\�B�&3Y��\�\��{T�v��_R�-�l��\�II\0g��q[�\�)giZF�椅�#�����\�n�\"2H\�\�Ka*$\�\�\�M%!H1��$�\n�*�>�1�\0T�I�A�U\n\�Kd\r�L�s?اa���c��֖˷RfAL�GH\"в\�IJ�\�	��U^H�\�)J��?�Ң-�\�	>�\�Oa�-\'Ѹ\�\�E�}\n��\n\n\��D��\�[\�4�J�$n�k�w\\:a>�z渝\�\� <�\�m�@��#�Gϟoz\�&\�nZV5\rs_ֈ��m8%6��(��ָs��\�qo���\�\r�\�D�$���\�:ʍ�u�����\�Q��BD��N*˞=-VAg\�:b�o\'V\r�\'yHA3\�	2\rf\�t\�9{qY\����5ۈ��(�k��y�΁��\��\����ʑb�\"3\��M\"6�$-2;f��\� �6Hrq1\�]*)JAڡf(��������TP��\�\�j!�p���\�g5�5�T�\�,�;��&�q��+p\�ؓ@��\n\�!S���MnRD�9���\�z\�=��$O�4GT�M��ۮ\�F\�Q���\�q\\,\�w�\��\�w]�w�\�(�\�Xˎ\Z�M\�֑\�6̖Ϙ`\���=�]r\�\�>��/�EUTa\nZ��#�QQ�y\�2�/0v8ڂ�~�\�s�óՌ��\�\�޴ז\�\�A\�-)��\�?l~U�\�\\��Vt[�\��~ČWX\�\�JACK\0�D\�s�c�A�TŐSA\�0\08S\�}@qH<\��	\"?��\�\�\n!#n�Pk	�RPB�9��\�j\�R-BB�pE\�nL�$�*\��@5��@;��T\�\"YJ��?z�S)�\nI\�>\�j&��o�ꀭ!�\��+Bm\�\�\�P#�w����r��k\�:x-\�\'wq�k�0�v�l\�j\�ݴݾ�\�I�$���\�\�\��\�&�J�\�ß5Z\�\�~;t��q-�7�hIQ0\�% }Ȭ\�\�\�����\�\��\��\0���\0P���	�Ӗ\�YBl4u�\�\�!\r��T��	0*�\'�?O�5���\0\�./\�z�\0��\�n9i�6~еRa\'\�/�ߎf��\0��\"#\\\�4~�\�tmE�6\��\�\��^r\�qe;֒��\�r+Z�p\�/�\�g=��q{fˉ�\�v\��b~P�u�6��|=�H�\�1�����4ڕh\�\�\�\�2;WE0*L�\��\�\�\� ���\Z�)*R�\��en<H#d��j��IX�\�\�Dm-�Z\�JV��\�\�?ٮ�\�=3\�.l\��\�6��V��N\'\���A ��N\�\�\���\�\r\�\�2\�*\0�r���4!�`��C��DB��q�m/�\�Mū�uG�\�\�W<\�\�ݼWYk�g\�3�ON�\�\�(iJU��\�\�[G\"عH}{�\0�G\�\Z\�p�WL���x��\n[�z��\'\0~dQ|�\0�.���\�\rw�ٵ٪�|�k�[���j�e,_�\�(ޥD�Kj=�\�-Ӷ^;0�|�A�\�Qŧ�\Z\�\�4�\0����Һr\�\�W\�\�i]�\�}O�N.\�ٝfW\�J\ZZ�s8=\�Ma�;T\�f���O�\0�kq\��\�m\��� \0~�\�(>YZ�JH\�\��QOy�݅3\�8��:r\�B���~tq������4\��\�<���vKaI��@�\�+�fB})\�P5Mn\�r��\�P	L��LM7RB} �#���\\�O�΁���ձc\�A\���\�K�ӣ\�zǤ<A�\���۶�7^\�kz\�^H}�g\�xB��\�V�0H\�\�N�\�����t/�\"\�Sih\�N���q7�z�ñk椂��\�\�R��\0��F\�bj{\�m��{���Ԏhϱ�Z]�\�M����\�d��\n\�yY\�A{���Gz�˖��\�0���5�\0C#B:�|1\�M\�֭̿�ު\�d\��R�\�I&=뿿�Fm\�7���Ph\�К�\�t�K\�ҴkAoo\�\�ʜP�Q1V]��ɏ\�Ӭ4+.�՞\�\��]<�EVn\��\0�Y\0,̔����\��0\�U�3�\�\�ٔ�ҡ\�kq���\�\�8\0?��u\�@��fv�Ϸzn\�ހ4�a3\���;A���#\�IV\�DN v�6�� ��EtlĪ�2b&�{+	J�4\rP\�\�	�I\�P5树��� JI\�1P\�\�6��\��	\�\�\�\�R\�E�@\����\�ǝq\�Z` !nl�B=C\0n&9\�ykэ\�I�\�\�Yijop\�LMr����r滪9u���\�)Z���\��\�9��R8\���\�F�\����T�Y\�Q���1\�Ϫ�\��gwV\�%f\�,���]�\�Hc\�O�9\�Z���\�}m�\�2�\�T�n(BV;�V�:�t�\�Z�ART\�\�`����9\�)�9MI䧁j(��D�w�\�\�nT\�\' ��4�\��O`:~��\��T\n\�B4\�RI\�g��\r\�nN�L�ރ\�Bd��{\����A3D�b�@�v��Gj�S�5&��9p�p\�f (�\�0q���]�nI�I�}M:-\��\�wځ.-K\0\�O��\�{v\�+q�N\\֟6�J\0�)$(W7�]v�Y\�\r�HZ�a��ß���\���Kü�]3�z�\��\�}!�p����)�/&w׷�%W!t�8�I�3��Mkn�ƅm\����\�&\�\�+\�I�-2�\�\���/�\�3R\�^ܾ���x�f\�6��JJ�~AD}��R\�\�\�/�S��mD��f�\����N\�#\�Zh@��1@�AL�\'�1@4\�qP\�\�R\0�\���c9�\�ԭ�%�\n�\�\�[j$!\\�`�z��\��\���\�\�\�@;�GqA\�\�uuY��mhm��%G�\�W+mṩ6����)\r\�z��r\�m���\�i&v��1ߟ���޹\�k�\�E=a��Uӿ��gM]\�e\�e�B\�\�Oh�\'ܐj�a\�\����\�\�ù-����\�\\%{}75Ue\��w`C��H*LD��\�\�הN��}�\0;Q$%>���{I\�\�\�\�\�\�\�Z\�/U\���`��(\"3\�֤n�\�\�\�]\���݇%���,I��I��\0\�I�\�K6]\��\�m׵J@b\�V�4;D�}�5�{L�qt-MZS\�]�]#�[캉����\�[uXt>\�2y��RT�\�$�=�P\�P�$�=����N\��\��4Vv�Bf=\�Qg)\�\�\nTDϽU�g\�\�($8�@ \�80{\����6\�CEŵ�\�N\��[j\�\�W��f䖳{\��k�9\��$\�Ϲ�W\r/�pZ\��������@�Gx�j�K����\�\�#�kx\�-���b�9\�\�L�>KH�o˳\�ڇ\�\�k:s��O-�\�M�\��k�(z�����2��\�\��\�N�-���j\r4X\�,S�9�A��Dc�\�=Y\�w�\�gG#�5\�M�qj�j�C�vcp���ֵ1\��c/.\�n�\0�c�_�oz���.І��<��i��\�/�n~\�p\\_	IW|q��\�\�-ɦK\�v��g\�{R�qE�_/\�\�\n��\n\�ځ�!&�|y\�{�z�\��RS�|]yn\���\0/j�~�\0Z\�#W(��\�\�\�\\l(\�QH\�c�i\�4�\�ܕG҃�����	28\�YWkŕ\�.-дz����FP[���\�UH\�\�eC<&���8�A\'RJ\�)ͩO\�\r�\�j�ct�f@\�Wh���\�/\�\�\'N�p�t�w�Ԝ�� |Ͽ�KY�\\2I���I<Ee20{������k�\�ie��X[n\'\nB�Ѐ~\�`�o\��\�:[�t\�\�l\�:�ȷ\�-\�z\�\�u�\�\r�)P\�E~�Z\�`�\'[\�,OV�љ�z\�W\�uThìY86��\0\��܏�\�\�Q�>�\����ڒ-zsFP\�\0\�\�\�6�\��\n\0\r�)\�{�RDLP��\�\�W\�tG��Q\�6ע�͍Q\��KQr\�\�%��nrB_V	���8��ix�\0p0(掮MD!@\��ڂ\�Ѻ���eF`H�E�km��IQ\�y[h@�\�v�A\�m\�J�s@Ѓ$\�\�z\�<[�UL\�e�ޤ�[X��Q�\��?$�\'��\�e\'��lO��-܃\��V�ڼ\�\Zv�\�j�\�G����U�\�\'\r\�${G�c�9\�\�o�x�\�\� �2\�Zf��u~�1�;P��j�\0Ou�%%�J��v&=��\\Yӟ\�\�%վ/$�\�к1�\�_ߵlՖ�\�J�HBX\�\�5	-q�`�\�_]�N�\�\�I\��&n\\\�S\�s�)D�R\��˖��\�&\n�c�(\Z\��*�\�=pm�VH1&&�\Z\"%&κ6k�J\�18��rّ*\���\�\�!��w\�\�Eq��σ\�/Gdm��Z|e�\\�=<\�֔�\0j!dg�p<��N)��\�DZU\�|w\�ވѝ\�4>���ҝIB�\n���%IO\'\0ME�Ϋ�վ-u�]\�\�\�uR\�:���mn�\�#�Ba2\'1چ\�S�\�\�j24	ޠ񝪠�3A\�&Gʀ+\�xј�\�iL��\Z��J�\�6b\�F>\��EՋQ�\nܒ�\�*�ǉ=\�*��9�*#\�\�\r2�I}��y	�\0�f�\�\��?�sd���P9*&�\�GnkC��P,\�P�Y\nj\�$sD63@��TQڕ}(?�\�rh\"(yoO��\rIp�`Ӂ%D��j\�\Z�-Q\'�\��9U�^(\0��`sUI�)`��\�\�DQ�B���F\��!j8\����\�j��k]�1�P5�L�(\n��\�֔��j�D9=�\�ń䚈B3@\��\�p\�\�\�=\"U�(\��\">?yP]:n\�J\�ґ�\�\�j&�\�ؿT�D\n��6˨d�M�\�)\�ZeԧxT�\�A?�T��b\�Z��ZmҀ�-9O\�}�\�k*�\���8\�`S�d{VY<$@\�v�19��rkJ�\�\�B�E��Ua�15Li\�2�G5 <c��i^JJ�\�\n��k&�\r�.�\��v�v�\�\�Z�\�q\�[�5\�mR�\0��+�\�\�R�jI\�`\�#4�KE�\rɘ�ڂ%���-\�\�\�AȂk9լ{N\�zoK��\�Y4\�ٸ�6�\'�^_k>��><,\�	\�^h6V%�\Z}�\��\�	?#I�K���rn2U�	��JgbW	�\�w��u-BRsZCP�ɩ�\�*�J#\�\�\�?��\�%Q\r�ӰM6�b\�:��ˠ)*\���\�\�L5\�6ݴ>�\�ś�i�iy��RLr~U\�\��\0_[0\�\�R\�\�S�	mHJDEX圚f\�\�\�\0L�5\�>f]�R��l\�u\nVW1\�~�Gi�Zu\�U\�\�(<��$��\�\�Ƃ6��\�\�G\�\Z\�],\�;�\�,�$���$��\0��׻�z��\�n��P�9@>³;t\�\�.\���\�]W���\�\�+�8G~\�G�J�BB�X��A��\���\�P*	R�H<�pvRU�\�Y\�qӟq\�\�O��\�a{\�^h���\�;�w����\"e#t\��\�\�ϖ�Q\��k��\0\�\����R�U�\�]B(�*LGʊ�\�ڊ�\�\��6��K\n �pS�5D\rHo�pL\�RBg\�Y˥\�n�\�?dՕ������y\������IÍ\��\�\�N(:cj�7E\\9�~{�+1�d�ܬ�c\�^��PP1#5G��!DЄ�	�HBNMA\� N\'������\��GT}=j��\�%h��Q\�=�\�x��\�\�\�\���.m\��\�kJ�pGh�K�\���۬5�6�0k\�2��-{�a$����%J\0#�?�\�'),(38,'Yeat',0,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0\n\Z\Z\Z!.%+!&8&+/1555\Z$;@;4?.451\Z\Z4!!!4144114=444141444444414414444?1144444444444?44114?��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0F\0\0\0\0\0!1AQ\"aq�2��Br���#Rb\�გ\�3���$45cs���\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0 \0\0\0\0\0\0\0\0\0\01!AQBq�\�\0\0\0?\0\�Ў�!�B8@Q\�Њ8�� (G�2!@P�\�0�(\�8�#f(\n)(�+B8@��p�� (G\n�@P��1hI��H%Q\�\r�\��\"ׁU�@��\�s��]����Uv�\���\09ع$���\�ll\�ݮ��\��xd !q\�7.E��E��e`ok\�y\�ӎ\�s�Ed\�\�p�\�\���\Z������ӳ\�Ȫ���	Vf[\�n�[�����\�qJ4�,\�\�Y���B����\�\�\�1r[]X܌ǩߙ2I�ǿ�\�\��\�\�\�zN��슕�\�\�\n]�\�=�\��\�\�\�\�+\�T�P�/;���;\�c\�:�f��S�d\� �\�L\�|��`u_=G[I�\�a,�\0\�J&\�^\�\�\�m.I\ntz�7\"W�[1*U��zڃ}E�\�2�@CB+G\n)#������\�B8@��BЀB��\��\�;AR�u��R\��d��$�\�u?\r�ܷ\�o��\�\�0�w�\�R\��B�,\�h��\�Tsm�\�	\��Mr\�\�ݝ�\�N�\��`R��\�\�\�\�yD\\v\�N�������\�}I�z\�\�\�i\�2\�\�ß��\Z\�5�\�K�^A��xp\�Y\�����5\���%\��@�� \�q\�/kT\n���-{\0Y۾!\�ם��\�wP\�\�8r\��E��\0I�<�.�˪\�}�q\�G�Wl\�G@9�g\�9�u��\�@�PȈ\�b0\�@\�`c��#��B8\n��)b+�#T�l�.OA\�+Zc;C��t�\�@є+6�\�E`s6��\��{N\�\�](\�,��6`T��yy[�:\�t���@w{[]��?6r	7��\���\���a*R22\��CF\�9\�\�da�\�F\�%;BD���\�\�u,�Gov\�+r�\�i�^TJ�Ht9YHe#pWPA�z�H\"\�c��0�<�0Ͳ��RNe~\�k�\��@\�1\�\0�!E%#$d`�ЁsBp�B\�q�\\3�P�7̅a�ۙ\0\�,u\�\�):v߃�6.�3�-�I�J\��\�=&�\�\�M�ڏG\�Sr�i�`��\�\�\��O�\�q5\�%\�O\�\�*\�\�[x\��\�oLe�+m\�}�\'�TG`����%�\�m�M=@��+�u\�A.�\�\�QA���\�fnx��<y~5�\�\��1[���Q�|��po� ���\�pR\�*\�U\��Vۑ�7�\��\�/�a��\�p�ԋBU@%�9lv7�\0K,�3e��a��iYz7\�\�`�>���N��nEż�\�y�\�}\�c��t���0�`����\�`� (G(‌RF(\n\�\�#�!\0�!F\"�(\�}���j\�q,\�$�N\�VG�5�r\�\�{x\�\�\�p�Z.��K)��\�1XZu�\�P\�\�\�\�x�\�\��\�I\�SP\�P�\�163Y�\'A\�y����xr�2x�\Z���VP�,ֿt�\�F�R\�\\iR�ZT^�@2�6��\�P�NW\�[k{	�p�k\�)\�-�\"86 Y�\r}�t�\\zU\�\�:�[�9j��kl!\�8\�AψaEv\nH&\�W��\�\� \�\�I_	J�\Ž�E#:0���}GS�\�R�ӢZ���7v\�\�.c+�I\"�\�A\�׺�\�{GV�\�-B\��F��\����F�\�a\�fm�x\�<f�\'�Å�u\��g2���G\�\�\�>�\�\�\�Ƀj��\�*7t\�@P\�{\�:\�p\'��M=\�^�4{.ú���\�\�\�i2���B!�B�8@P���B�\�\0�!\0�!5_*�\�	\��\�9��Y��:�R�\���\"�ua~�=�\'Q�\�Ը��Le.\�qv\�q��\�m�\0l?��2ǔ\�Xe\�-�\��{̠\r��_\��\�v�@;��\�|]4jt\�)`>\\\�e��\r\�\�\�w��X\�\�\�ԛ�tU\Z�\�<7Z�U�\��\�n�\�5\�J\�y[o\�o)�qN3_A��e\Z(�\��\�\�\�\�\"D\�\��\�\�\�!\�l\�LK\0`o�\��lp��k(j-e\��\�����ķf\'K�\�\�\���A�\"\��i\�\�kk��\�dC�ņ\�ُ��3^��.�\��\�hJ\�B;E��1CB�2P�(\n\�\�p�4!@!@P�(\�;S�\�\�i5:ŀZ\�\�-\�U�݆\0n`|\�l�\rMX�\�	SpHǨ\�`yk�`^�W�PY����\�\�ALt\�\�8�����\�\�M�s����Q�PS{�ֿ.`\��\�K�	�\"��v�\0 !0	�\�R�+\nu]6���3�\\�\�O�\�%�[����zC?���\"\�\�2ս�\�5�K7\\�O�\\֜\�\�\'mw\�׬�.I\�t�\�u�V\���\�\��j%6���(�fk��Zb�E\�;\�1���\"�,>�M	\�\�:u�\'��\�\�\"Z\�p�┘7\��\�*(u>��=�G�}�\�\�H��ҮG�6\�^\�_v�����\�pVy:5�X:�VR\n�6*�\�0=D�D��G	�\�\Z��\n�ͳ\�¢\�\��\��\0�3s\nP�Ёs@CB��(\�H�\�}�\"[\��h�z\���!���7��MN\\%#S_��.�\�~#\�m\�,������\�]��\�F\\�\�R�;\��J3��\�E�<�ڞpؚ\�\�v⧼���=o6N\�{M\�T�:�L	��M�bXy\�Mj�_1$�I$�nw$\�nab��ɲ\�\�vk�uqm{䤿C�\��o�\�(q���\�\�=\���\�;�ߤ�x\�^%Kʡm�9@���\�\�\�\�%@7\�&}|�\�bݥ]�\�\�s\����m\�\�\�Jh~\�r�������\�0�g�iL��\�z�\0H�~�*ѩ�̒Ⱥvbػ\�\�\��J���e?�铑{?�\���G\�:\�\�AB\�!hCB��\�h;c�\�Tjgj�sE���Ā/� �`5$�����>\�B�Cf}�R.����\�����j;oSjj=\�sP�\�z9�m\�4�MB�\�M<D\�\�\�L�\�|WR���\�\�\�\�rO�18\�a=Ѱ\�{\�	k�t���Zy�\"\�O\��b\0\�++XwGYs��f�R��by�Rie\�ү��ҵK�\�\�\'G\r��\�L�\��N>�i�\�QT\0����\�ǘ�ͦS\�\\�Zr\�Z�W(�8\�\'3%TC1Y�`�l\�{��\�%aTs��-ϐ��dVCk\�!\�\�K|F��\n�\\\�>�\�\"\�K\��k\�\�\�mO\�Dnt\�t\�nR�\r��YQdeԽ�\'\�\�H|\�\�\�:ќ�ث�H\�E#\���	\�$�B8@��!\rB�ƭ\nU+���3�79F\�\�oY\�)\�*b*�z�\�rN�(��\�\�u�i|q�£�-�\no��6ӥ�\'\Zƥ3s{?�x��֮\�_]\��`�3-�\�R<�\�O�\����]�\�-��^C\���el=\�<褱�\�ѱ\�(6��\�\�7W*\�O���m\\�ԝ-`6�u�p�\�ۙ=\0\�f\�d::\�ڎ�O���\���\����.\\����\�Dɍ}$X\�\"Z�e6Uv\�IA���RE*���J�\�s\�\�u�_	\Zj\����sf\���\�W�ᜡو�ɞه���]5\�V:�O[h<��������{8▿�O�ռ�\�v���v?qѿ��?�\�/Ƹ\��\0y:�w��\�)wjS��}�\��KF7\�z�-]id\�\�X����!�\�\Z\�R�yd`~�Y\�g�)�V���~$���\�1-�\0\r~s�IPB�\\B��!5^\�v�a���?��ʻ3~CפI�\�}�\��oR�]K.�r�RG��jx�v\'��\�bso,\rn��9ۺ�`ɶ���#��*�I$�r�\��\rH�!\�+��bu:�\�J8u%�7y��^��\�&!}%ks�+U��S�\���)�A\�I<=R�DR\�h���4\���\�jȸæU�\�i���?���\�p�\�\�\�R�sjϓ\�\�	иd��Zy��+\0KVU�Rw�e�A\�.:ɹ\ZӛQ\��5S�^2����\�jT�Eq\�S�\�n���\�R�\�\�-z�P�\�eD\0:�2S\"\�2��\�u\�bxS a�\�r\�\�\�sf\�^r�\'ٿ�>㶞�y�\'\n\�C^FE\�u�#\�N�1l�\�Q���/\�f\r\�*�ԩE�\\\�\�{���R�[_��\��\�\�ƠE\�\�P38�0�T\�P�lw�\�N�LIL(@\0\0\0\04\0	i\�ݺHLe\'0g��*Nw\'I��%��F\�apՁz?�}\�yv���Z�ٞg��ӧ	g�\�\\�b	\�%\�>cq,W_\�?�\�S�ǻK]}�-;Y{��g�\�o�\�\��r�^\'�c\�:O�\���\0�\�ӗ{�&)���\�({��Υ:\�#hG	^8B\Zc�\�ze�sݧMA,\�vP.d\�\0$\�SĻ3\��ժlr=@�G\�P0\0yΗ�Ħl䋨�\�r/rv6��\�t�፮Ϟ�w@��ab?����-��&vt\�	{r>#\��\'J\�\��}�l�?��\���\�V*J��a��*\�\�g�\�6�@O\"z�	�\��R�\�M46�\rlJ��x�[�%�\�\�y\�\�\�\nj9�4w=Y�\0=»Ó��Jf\�!�5BN\��ɷ#\�2\�o�B��\��k�-�\���Ks\�1p~\�$\�2a*�]�A�����\�v0�\�֣Hk�j�|B�\�v4[0�щ�;\�\�73�R������Y9ո���\�\r�CR�mgl�M~m7\���I-F�:`�D�ms\�y�\�\�1`#^{\\�\�ǆ�\��\�\�\�ߔ�\"cO�*KT\�\r͂�6ӼyK�������Dv\0x�\�,\�q\���\\Z!��t6�IUqs\�R�s�*���E\�gip\�\Z�,~B�Bb\\�vc��eJ.I�����$ʠ\Z \�}\0�\�A��\�%E�\�S\�}���\0Y��.}\�[ԩ(�Kt�\�V.K�*�*KJ�N�\�\�\�k�\�&y	\�\��5Z��K3t�S\�\�\�Ot�M{�\\lap�\��ڗT?��?\'\'\����(\�\�;�\�$\�\0-vf;9q\�.0�\�C\�m\�\n\�_=\��&o�\��^��\nJ���\��I\�\�1\�\�>U���Ç\�\�,�\�\�;�\\\�B�Q�P=M\�\�\r�8M�P�!\�<C\�	�k\'(c�Q3��Z\�{�>&�k[�\�x�նPy^^R\n��\�Aa��C*\r\'�Z�Y\�Hd93������\�\�@i\�Tæ�K\�/o\�N��\�m\�\�\�p�\�TJ�:�u�)@{\�\'v$\\���\�\�\�\Z�ԓ�\��\0G*>�JH��0\Z龺�\����c�M�\0x�$��B�I\'P3s\�>O�-�\�\�瘘\�\�\�p�A}� \�\�v\�ɽ����\�af2�REP\0\�\0�*bm��%\�W�\�и���$���|W!������s��/�VŹ��eU?f:�\�ݮ\�\�mӬ�+Vc#/�\�\�.�w�\Zk\�܏\�s���g饪;\n�\�\�\�g�D\Z ��3�x\n`\�\"��\��k�^D��y��:k\���H\�Y]iwWɪ\�y�/)�LXe6 �\�\�s\�Ss����\Z�\��\�G�$����Ok�\�JF��I$�9\�\�_P�\�^\�]�`Kz\�\�[4�\�kT\�ViR�JH��\�j�i�g,��\�o\��J\r��m\�a�G\Zi\�WP:���f��\�?٩5#j\�T\�`u�L\�O�6�xzND�z|Xk\�y�\��\0X��wc8<�J�H֥b\�EP>�\�I\�^\�p�\0q�\�\�\"\�)�o��v���<�\� !#B�\n��7\���&3굇qdw�\��#\����)\�\�\�!	gٟ�\��\�\�\�B\�Q�-[��&j��\�\�j��f/�?�F�Lp�t\�\�b~?��X\��\�7\�MN��d�?�\�3#a\�&kX��V(Dt�T\�c��!.=-1T!	\�v\�zq�h\���o��\0\�\�W���\'����uZ�\�\�󞭣�\���&�N�!B��\�'),(39,'21 Savage',1,NULL);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `update_follower_count` AFTER INSERT ON `Followers` FOR EACH ROW BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `decrease_follower_count` AFTER DELETE ON `Followers` FOR EACH ROW BEGIN
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
CREATE DEFINER=`admin`@`%` PROCEDURE `AddSongToPlaylist`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `CreatePlaylist`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `DeleteSongFromPlaylist`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `FollowArtist`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `GetPlaylistSongs`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `GetUserIdByUsername`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `LikePlaylist`(IN user_id INT, IN playlist_id INT)
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
CREATE DEFINER=`admin`@`%` PROCEDURE `LikeSong`(IN user_id INT, IN song_id INT)
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
CREATE DEFINER=`admin`@`%` PROCEDURE `LoginUser`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `RegisterUser`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `SearchAll`(
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
CREATE DEFINER=`admin`@`%` PROCEDURE `UnlikePlaylist`(IN user_id INT, IN playlist_id INT)
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
CREATE DEFINER=`admin`@`%` PROCEDURE `UnlikeSong`(IN user_id INT, IN song_id INT)
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
CREATE DEFINER=`admin`@`%` PROCEDURE `UpdateUserDetails`(
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
